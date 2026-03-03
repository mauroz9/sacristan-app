import 'dart:convert';

import 'package:pantalla_login_ui/core/interfaces/sequence_interface.dart';
import 'package:pantalla_login_ui/core/models/library_sequence_response_model.dart';
import 'package:pantalla_login_ui/core/models/page_model.dart';
import 'package:http/http.dart' as http;
import 'package:pantalla_login_ui/core/models/sequence_response_model.dart';
import 'package:pantalla_login_ui/core/others/exception_handler.dart';
import 'package:pantalla_login_ui/core/others/token_storage.dart';

class SequenceService implements ISequenceService {

    final String _baseUrl = TokenStorage.baseUrl;

  
  @override
  Future<Page<LibrarySequenceResponseModel>> getSequences([String? categoryId, String? searchQuery]) async {
    final http.Response response;
    final token = await TokenStorage().getToken();

    try {

      var uri = "$_baseUrl/api/v1/student/sequences?categoryId=${categoryId ?? ""}&search=${searchQuery ?? ""}";

      response = await http.get(Uri.parse(uri), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });

      ExceptionHandler.handle(response.statusCode);

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = jsonDecode(response.body) as Map<String, dynamic>;
        return Page.fromJson(body, (item) => LibrarySequenceResponseModel.fromJson(item as Map<String, dynamic>));
      } else {
        throw Exception("Error desconocido al obtener las secuencias.");
      }


    } catch (e) {
      rethrow;
    }

  }

  @override
  Future<SequenceResponseModel> getSequenceDetails(int sequenceId) async {
    final http.Response response;
    final token = await TokenStorage().getToken();

    try {
      var uri = "$_baseUrl/api/v1/student/sequences/$sequenceId";
      print("URI: $uri");

      response = await http.get(Uri.parse(uri), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });

      ExceptionHandler.handle(response.statusCode);

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = jsonDecode(response.body) as Map<String, dynamic>;
        return SequenceResponseModel.fromJson(body);
      } else {
        throw Exception("Error desconocido al obtener los detalles de la secuencia.");
      }


    } catch (e) {
      rethrow;
    }

  }
  
}

