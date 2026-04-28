import 'dart:developer';

import 'package:pantalla_login_ui/core/interfaces/reproduction_interface.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pantalla_login_ui/core/models/sequence_reproduction_stats.dart';
import 'package:pantalla_login_ui/core/others/exception_handler.dart';
import 'package:pantalla_login_ui/core/others/token_storage.dart';
import 'package:pantalla_login_ui/core/others/http_client_wrapper.dart';

class ReproductionService implements ReproductionServiceI {
  final _httpClient = HttpClientWrapper();

  @override
  Future<int> startReproduction(int routineSequenceId) async {
    http.Response response;

    response = await _httpClient.post(
      Uri.parse("${TokenStorage.baseUrl}/api/v1/student/reproductions/$routineSequenceId"),
      headers: {
        "Content-Type": "application/json",
      });
    ExceptionHandler.handle(response.statusCode);

    if (response.statusCode == 201) {
      return int.parse(response.body);
    } else {
      throw Exception("Error desconocido al iniciar la reproducción.");
    }

  }

  @override
  Future<void> endReproduction(SequenceReproductionStats reproductionStats) async {
    http.Response response;

    response = await _httpClient.put(
      Uri.parse("${TokenStorage.baseUrl}/api/v1/student/reproductions/${reproductionStats.reproductionId}/end"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(reproductionStats.toJson()),
    );

    ExceptionHandler.handle(response.statusCode);

    log("Reproduction ended with status code: ${response.statusCode}");
    log("Response body: ${response.body}");

    if (response.statusCode != 200) {
      throw Exception("Error desconocido al finalizar la reproducción.");
    }
  }

}