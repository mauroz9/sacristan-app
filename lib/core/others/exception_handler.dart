import 'package:pantalla_login_ui/core/others/token_storage.dart';

class ExceptionHandler {

  static Future<void> handle(int statusCode) async {

    if (statusCode >= 200 && statusCode < 300) {
      return; // Respuesta exitosa, no se lanza ninguna excepción
    }
    
    switch (statusCode) {
      case 400:
        throw Exception("Solicitud inválida. Verifica los datos enviados.");
      case 401:
        await TokenStorage().forceLogout();
        throw Exception("No autorizado. Inicia sesión para acceder a este recurso.");
      case 403:
        throw Exception("Prohibido. No tienes permisos para acceder a este recurso.");
      case 404:
        throw Exception("Recurso no encontrado. Verifica la URL solicitada.");
      case 500:
        throw Exception("Error del servidor. Intenta nuevamente más tarde.");
      default:
        throw Exception("Código de estado desconocido: $statusCode");
    }

  }

}