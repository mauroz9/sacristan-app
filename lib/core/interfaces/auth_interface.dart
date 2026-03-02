import 'package:pantalla_login_ui/core/models/login_request_model.dart';
import 'package:pantalla_login_ui/core/models/login_response_model.dart';

abstract class IAuthService {
  Future<LoginResponse> login(LoginRequest request);
  Future<void> logout();
}