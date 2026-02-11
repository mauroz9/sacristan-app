import 'package:flutter/material.dart';
import 'package:pantalla_login_ui/features/login/ui/login_view.dart';
import 'package:pantalla_login_ui/pages/main_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      initialRoute: '/login',
      routes: {'/login': (context) => LoginView(), '/home': (context) => MainView()},
    );
  }
}
