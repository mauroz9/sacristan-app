class ExceptionHandler {

  static void handle(int statusCode) {

    if (statusCode >= 200 && statusCode < 300) {
      return; // Respuesta exitosa, no se lanza ninguna excepción
    }
    
    switch (statusCode) {
      case 400:
        throw Exception("Solicitud inválida. Verifica los datos enviados.");
      case 401:
        throw Exception("No autorizado. Inicia sesión para acceder a este recurso.");
      case 403:
        throw Exception("Prohibido. No tienes permisos para acceder a este recurso.");
      case 404:
        throw Exception("Recurso no encontrado. Verifica la URL solicitada.");
      case 500:
        throw Exception("Error del servidor. Intenta nuevamente más tarde.");
      default:
        print("Código de estado desconocido: $statusCode");
    }

  }

}