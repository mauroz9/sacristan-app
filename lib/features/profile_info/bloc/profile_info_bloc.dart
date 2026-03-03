import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pantalla_login_ui/core/models/student_response_model.dart';
import 'package:pantalla_login_ui/core/services/user_service.dart';

part 'profile_info_event.dart';
part 'profile_info_state.dart';

class ProfileInfoBloc extends Bloc<ProfileInfoEvent, ProfileInfoState> {
  ProfileInfoBloc(UserService userService) : super(ProfileInfoInitial()) {
    on<ProfileInfoRequested>((event, emit) async{
      emit(ProfileInfoLoading());

      try{
        final response = await userService.getUserInfo();

        emit(ProfileInfoSuccess(response: response));
      }on UserException catch (e){
        emit(ProfileInfoError(message: e.message));
      }catch(e){
        emit(ProfileInfoError(message: "Ocurrio un error inesperado: $e"));
      }
    });
  }
}
