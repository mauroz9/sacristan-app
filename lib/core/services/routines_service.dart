import 'dart:convert';

import 'package:pantalla_login_ui/core/interfaces/routines_interface.dart';
import 'package:pantalla_login_ui/core/models/principal_sequence_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:pantalla_login_ui/core/others/exception_handler.dart';
import 'package:pantalla_login_ui/core/others/token_storage.dart';
import 'package:pantalla_login_ui/core/others/http_client_wrapper.dart';
import 'package:pantalla_login_ui/core/models/page_model.dart';

class RoutinesService implements IRoutinesService {
  final _httpClient = HttpClientWrapper();
  
  @override
  Future<Page<PrincipalSequenceResponseModel>> getPendingSequences() async {

    try {      
      final http.Response response;
      final String baseUrl = TokenStorage.baseUrl;

      response = await _httpClient.get(Uri.parse("$baseUrl/api/v1/student/routines"), headers: {
        "Content-Type": "application/json",
      });

      ExceptionHandler.handle(response.statusCode);

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = jsonDecode(response.body) as Map<String, dynamic>;
        return Page.fromJson(body, (item) => PrincipalSequenceResponseModel.fromJson(item as Map<String, dynamic>));
      } else {
        print("Status Code: ${response.statusCode}");
        throw Exception("Error desconocido al obtener las secuencias pendientes.");
      }

    } catch (e) {
      rethrow;
    }

  }
  
}