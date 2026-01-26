import 'package:flutter/material.dart';
import 'package:pantalla_login_ui/shared/form_container.dart';
import 'package:pantalla_login_ui/shared/top_logo.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 100),
          TopLogo(),
          FormContainer()
        ],
      ),
    );
  }
}