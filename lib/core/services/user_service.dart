import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pantalla_login_ui/core/interfaces/user_interface.dart';
import 'package:pantalla_login_ui/core/models/student_punctuation_response_model.dart';
import 'package:pantalla_login_ui/core/models/student_response_model.dart';
import 'package:pantalla_login_ui/core/models/teacher_response_model.dart';
import 'package:pantalla_login_ui/core/others/token_storage.dart';
import 'package:pantalla_login_ui/core/others/exception_handler.dart';
import 'package:pantalla_login_ui/core/others/http_client_wrapper.dart';

class UserException implements Exception {
  final String message;
  const UserException(this.message);

  @override
  String toString() => message;
}

class UserService implements IUserService {
  final String _baseUrl = TokenStorage.baseUrl;
  final _httpClient = HttpClientWrapper();

  @override
  Future<TeacherResponseModel> getTeacherInfo() async {
    final http.Response response;

    try {
      response = await _httpClient.get(
        Uri.parse("$_baseUrl/api/v1/student/user/teacher"),
        headers: {
          "Content-Type": "application/json",
        },
      );
    } on SocketException {
      throw const UserException(
        "No se pudo conectar al servidor. Verifica tu conexión.",
      );
    } catch (e) {
      throw const UserException("Error de conexión inesperado.");
    }

    ExceptionHandler.handle(response.statusCode);

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = jsonDecode(response.body);
      return TeacherResponseModel.fromJson(body);
    } else {
      throw UserException(
        "Error del servidor (${response.statusCode}). Intenta más tarde.",
      );
    }
  }

  @override
  Future<StudentResponseModel> getUserInfo() async {
    final http.Response response;

    try {
      response = await _httpClient.get(
        Uri.parse("$_baseUrl/api/v1/student/user/profile"),
        headers: {
          "Content-Type": "application/json",
        },
      );
    } on SocketException {
      throw const UserException(
        "No se pudo conectar al servidor. Verifica tu conexión.",
      );
    } catch (e) {
      throw const UserException("Error de conexión inesperado.");
    }

    ExceptionHandler.handle(response.statusCode);

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = jsonDecode(response.body);
      return StudentResponseModel.fromJson(body);
    } else {
      throw UserException(
        "Error del servidor (${response.statusCode}). Intenta más tarde.",
      );
    }
  }

  @override
  Future<StudentPunctuationResponseModel> getUserPunctuation() async {

      final http.Response response;
  
      try {
        response = await _httpClient.get(
          Uri.parse("$_baseUrl/api/v1/student/user/punctuation"),
          headers: {
            "Content-Type": "application/json",
          },
        );
      } on SocketException {
        throw const UserException(
          "No se pudo conectar al servidor. Verifica tu conexión.",
        );
      } catch (e) {
        throw const UserException("Error de conexión inesperado.");
      }
  
      ExceptionHandler.handle(response.statusCode);
  
      if (response.statusCode == 200) {
        final Map<String, dynamic> body = jsonDecode(response.body);
        return await StudentPunctuationResponseModel.fromJson(body);
      } else {
        throw UserException(
          "Error del servidor (${response.statusCode}). Intenta más tarde.",
        );
      }

  }
}
