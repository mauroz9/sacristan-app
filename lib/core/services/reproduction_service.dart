import 'package:pantalla_login_ui/core/interfaces/reproduction_interface.dart';
import 'package:http/http.dart' as http;
import 'package:pantalla_login_ui/core/others/exception_handler.dart';
import 'package:pantalla_login_ui/core/others/token_storage.dart';

class ReproductionService implements ReproductionServiceI {

  @override
  Future<int> startReproduction(int routineSequenceId) async {
    http.Response response;
    final token = await TokenStorage().getToken();

    response = await http.post(
      Uri.parse("${TokenStorage.baseUrl}/api/v1/student/reproductions/$routineSequenceId"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      });
    ExceptionHandler.handle(response.statusCode);

    if (response.statusCode == 201) {
      return int.parse(response.body);
    } else {
      throw Exception("Error desconocido al iniciar la reproducción.");
    }

  }

  @override
  Future<void> endReproduction(int reproductionId) async {
    http.Response response;
    final token = await TokenStorage().getToken();

    response = await http.put(
      Uri.parse("${TokenStorage.baseUrl}/api/v1/student/reproductions/$reproductionId/end"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      });

    ExceptionHandler.handle(response.statusCode);

    if (response.statusCode != 200) {
      throw Exception("Error desconocido al finalizar la reproducción.");
    }
  }

}