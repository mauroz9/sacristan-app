import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pantalla_login_ui/core/others/token_storage.dart';

class HttpClientWrapper {
  static final HttpClientWrapper _instance = HttpClientWrapper._internal();

  factory HttpClientWrapper() {
    return _instance;
  }

  HttpClientWrapper._internal();

  final String _baseUrl = TokenStorage.baseUrl;
  static const _maxRetries = 1; // Prevent infinite loops

  /// Performs a GET request with automatic token refresh on 401
  Future<http.Response> get(
    Uri url, {
    Map<String, String>? headers,
    int retryCount = 0,
  }) async {
    final token = await TokenStorage().getToken();
    final updatedHeaders = headers ?? {};
    updatedHeaders['Authorization'] = 'Bearer $token';

    try {
      final response = await http.get(url, headers: updatedHeaders);

      if (response.statusCode == 401 && retryCount < _maxRetries) {
        // Try to refresh token
        final refreshed = await _refreshToken();
        if (refreshed) {
          // Retry the original request with new token
          return get(url, headers: headers, retryCount: retryCount + 1);
        } else {
          // Refresh failed, force logout
          await TokenStorage().forceLogout();
          throw Exception('Token refresh failed. Session expired.');
        }
      }

      return response;
    } catch (e) {
      throw Exception('GET request failed: $e');
    }
  }

  /// Performs a POST request with automatic token refresh on 401
  Future<http.Response> post(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
    int retryCount = 0,
  }) async {
    final token = await TokenStorage().getToken();
    final updatedHeaders = headers ?? {};
    updatedHeaders['Authorization'] = 'Bearer $token';

    try {
      final response = await http.post(
        url,
        headers: updatedHeaders,
        body: body,
        encoding: encoding,
      );

      if (response.statusCode == 401 && retryCount < _maxRetries) {
        // Try to refresh token
        final refreshed = await _refreshToken();
        if (refreshed) {
          // Retry the original request with new token
          return post(url,
              headers: headers,
              body: body,
              encoding: encoding,
              retryCount: retryCount + 1);
        } else {
          // Refresh failed, force logout
          await TokenStorage().forceLogout();
          throw Exception('Token refresh failed. Session expired.');
        }
      }

      return response;
    } catch (e) {
      throw Exception('POST request failed: $e');
    }
  }

  /// Performs a PUT request with automatic token refresh on 401
  Future<http.Response> put(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
    int retryCount = 0,
  }) async {
    final token = await TokenStorage().getToken();
    final updatedHeaders = headers ?? {};
    updatedHeaders['Authorization'] = 'Bearer $token';

    try {
      final response = await http.put(
        url,
        headers: updatedHeaders,
        body: body,
        encoding: encoding,
      );

      if (response.statusCode == 401 && retryCount < _maxRetries) {
        // Try to refresh token
        final refreshed = await _refreshToken();
        if (refreshed) {
          // Retry the original request with new token
          return put(url,
              headers: headers,
              body: body,
              encoding: encoding,
              retryCount: retryCount + 1);
        } else {
          // Refresh failed, force logout
          await TokenStorage().forceLogout();
          throw Exception('Token refresh failed. Session expired.');
        }
      }

      return response;
    } catch (e) {
      throw Exception('PUT request failed: $e');
    }
  }

  /// Performs a DELETE request with automatic token refresh on 401
  Future<http.Response> delete(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
    int retryCount = 0,
  }) async {
    final token = await TokenStorage().getToken();
    final updatedHeaders = headers ?? {};
    updatedHeaders['Authorization'] = 'Bearer $token';

    try {
      final response = await http.delete(
        url,
        headers: updatedHeaders,
        body: body,
        encoding: encoding,
      );

      if (response.statusCode == 401 && retryCount < _maxRetries) {
        // Try to refresh token
        final refreshed = await _refreshToken();
        if (refreshed) {
          // Retry the original request with new token
          return delete(url,
              headers: headers,
              body: body,
              encoding: encoding,
              retryCount: retryCount + 1);
        } else {
          // Refresh failed, force logout
          await TokenStorage().forceLogout();
          throw Exception('Token refresh failed. Session expired.');
        }
      }

      return response;
    } catch (e) {
      throw Exception('DELETE request failed: $e');
    }
  }

  Future<bool> _refreshToken() async {
    try {
      final refreshToken = await TokenStorage().getRefreshToken();

      if (refreshToken == null) {
        return false;
      }

      final response = await http.post(
        Uri.parse('$_baseUrl/refresh-token'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'refreshToken': refreshToken}),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = jsonDecode(response.body);
        final String newToken = body['token'] as String;
        final String? newRefreshToken = body['refreshToken'] as String?;

        await TokenStorage().saveToken(newToken);
        if (newRefreshToken != null) {
          await TokenStorage().saveRefreshToken(newRefreshToken);
        }

        return true;
      } else if (response.statusCode == 401 || response.statusCode == 403) {
        return false;
      } else {
        return false;
      }
    } on SocketException {
      return false;
    } catch (e) {
      return false;
    }
  }
}
