
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pantalla_login_ui/core/interfaces/auth_interface.dart';
import 'package:pantalla_login_ui/core/models/login_request_model.dart';
import 'package:pantalla_login_ui/core/models/login_response_model.dart';
import 'package:pantalla_login_ui/core/services/token_storage_service.dart';

class AuthException implements Exception {
  final String message;
  const AuthException(this.message);

  @override
  String toString() => message;
}


class AuthService implements IAuthService {

  
  final String _baseUrl = '${TokenStorage.baseUrl}/auth';


  @override
  Future<LoginResponse> login(LoginRequest request) async {
    final http.Response response;

    try {
      response = await http.post(
        Uri.parse("$_baseUrl/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(request.toJson()),
      );
    } on SocketException {
      throw const AuthException("No se pudo conectar al servidor. Verifica tu conexión.");
    } catch (e) {
      throw const AuthException("Error de conexión inesperado.");
    }

    if (response.statusCode == 201) {
      final Map<String, dynamic> body = jsonDecode(response.body);
      return LoginResponse.fromJson(body);
    } else if (response.statusCode == 401) {
      throw const AuthException("Credenciales incorrectas. Verifica tu email y contraseña.");
    }else if (response.statusCode == 403) {
      throw const AuthException("Tu cuenta ha sido bloqueada. Contacta al soporte.");
    } else if (response.statusCode == 400) {
      throw const AuthException("Datos de inicio de sesión inválidos.");
    } else {
      throw AuthException("Error del servidor (${response.statusCode}). Intenta más tarde.");
    }
  }

  @override
  Future<void> logout() async {
    final storage = TokenStorage();
    await storage.deleteToken();
  }
}