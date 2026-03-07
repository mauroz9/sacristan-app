import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pantalla_login_ui/main.dart';

class TokenStorage {
  final _storage = const FlutterSecureStorage();

  static const _keyToken = 'auth_token';
  //static const baseUrl = 'http://10.0.2.2:8080';
  static const baseUrl = 'http://87.222.42.195:8000';

  Future<void> saveToken(String token) async {
    await _storage.write(key: _keyToken, value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: _keyToken);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: _keyToken);
  }

  Future<void> forceLogout() async {
    await TokenStorage().deleteToken();
    
    navigatorKey.currentState?.pushNamedAndRemoveUntil('/login', (route) => false);

    final context = navigatorKey.currentContext;
    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Tu sesión ha expirado. Vuelve a iniciar sesión.'),
          backgroundColor: Colors.grey,
          duration: Duration(seconds: 4),
        ),
      );
    }
  }
}