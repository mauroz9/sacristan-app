import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:pantalla_login_ui/core/models/login_request_model.dart';
import 'package:pantalla_login_ui/core/models/login_response_model.dart';
import 'package:pantalla_login_ui/core/services/auth_service.dart';
import 'package:pantalla_login_ui/core/services/token_storage_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(AuthService authService) : super(LoginInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(LoginLoading());

      if (event.email.trim().isEmpty || event.password.trim().isEmpty) {
        emit(LoginError(message: "Por favor, completa todos los campos."));
        return;
      }

      try{
        final response = await authService.login(LoginRequest(email: event.email, password: event.password),).timeout(const Duration(seconds: 10));

        final storage = TokenStorage();
        await storage.saveToken(response.token);
        print(response.token);

        if(!response.roles.contains('STUDENT')){
          emit(LoginError(message: "Acceso denegado: Esta aplicación es solo para alumnos."));
          authService.logout();
          return;
        }

        emit(LoginSuccess(response: response));
      }on AuthException catch (e){
        emit(LoginError(message: e.message));
      }catch (e){
        emit(LoginError(message: "Ocurrio un error inesperado: $e"));
      }
    });
  }
}
