import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pantalla_login_ui/main.dart';

class TokenStorage {
  final _storage = const FlutterSecureStorage();

  static const _keyToken = 'auth_token';
  static const _keyRefreshToken = 'refresh_token';
  static const baseUrl = 'http://10.0.2.2:8080';


  Future<void> saveToken(String token) async {
    await _storage.write(key: _keyToken, value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: _keyToken);
  }

  Future<void> saveRefreshToken(String refreshToken) async {
    await _storage.write(key: _keyRefreshToken, value: refreshToken);
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _keyRefreshToken);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: _keyToken);
  }

  Future<void> deleteRefreshToken() async {
    await _storage.delete(key: _keyRefreshToken);
  }

  Future<void> deleteAllTokens() async {
    await _storage.delete(key: _keyToken);
    await _storage.delete(key: _keyRefreshToken);
  }

  Future<void> forceLogout() async {
    await deleteAllTokens();
    
    navigatorKey.currentState?.pushNamedAndRemoveUntil('/login', (route) => false);

    final context = navigatorKey.currentContext;
    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Tu sesión ha expirado. Vuelve a iniciar sesión.'),
          backgroundColor: Color.fromRGBO(31, 60, 139, 1.0),
          duration: Duration(seconds: 4),
        ),
      );
    }
  }
}