import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pantalla_login_ui/core/interfaces/user_interface.dart';
import 'package:pantalla_login_ui/core/models/student_response_model.dart';
import 'package:pantalla_login_ui/core/models/teacher_response_model.dart';
import 'package:pantalla_login_ui/core/services/token_storage_service.dart';

class UserException implements Exception {
  final String message;
  const UserException(this.message);

  @override
  String toString() => message;
}

class UserService implements IUserService {
  final String _baseUrl = TokenStorage.baseUrl;

  @override
  Future<TeacherResponseModel> getTeacherInfo() async {
    final http.Response response;
    final token = await TokenStorage().getToken();

    try {
      response = await http.get(
        Uri.parse("$_baseUrl/api/v1/student/user/profile"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
    } on SocketException {
      throw const UserException(
        "No se pudo conectar al servidor. Verifica tu conexión.",
      );
    } catch (e) {
      throw const UserException("Error de conexión inesperado.");
    }

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = jsonDecode(response.body);
      return TeacherResponseModel.fromJson(body);
    } else if (response.statusCode == 401) {
      throw const UserException(
        "Error de autenticación",
      );
    } else if (response.statusCode == 403) {
      throw const UserException(
        "No tienes permisos para acceder a este recurso.",
      );
    } else if (response.statusCode == 400) {
      throw const UserException("Usuario no recibido");
    } else {
      throw UserException(
        "Error del servidor (${response.statusCode}). Intenta más tarde.",
      );
    }
  }

  @override
  Future<StudentResponseModel> getUserInfo() async {
    final http.Response response;
    final token = await TokenStorage().getToken();

    try {
      response = await http.get(
        Uri.parse("$_baseUrl/api/v1/student/user/teacher"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
    } on SocketException {
      throw const UserException(
        "No se pudo conectar al servidor. Verifica tu conexión.",
      );
    } catch (e) {
      throw const UserException("Error de conexión inesperado.");
    }

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = jsonDecode(response.body);
      return StudentResponseModel.fromJson(body);
    } else if (response.statusCode == 401) {
      throw const UserException(
        "Error de autenticación",
      );
    } else if (response.statusCode == 403) {
      throw const UserException(
        "No tienes permisos para acceder a este recurso.",
      );
    } else if (response.statusCode == 400) {
      throw const UserException("Usuario no recibido");
    } else {
      throw UserException(
        "Error del servidor (${response.statusCode}). Intenta más tarde.",
      );
    }
  }
}
