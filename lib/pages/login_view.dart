import 'package:flutter/material.dart';
import 'package:pantalla_login_ui/features/login/ui/personalized_widgets/form_container.dart';
import 'package:pantalla_login_ui/shared/top_logo.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              TopLogo(),
              FormContainer()
            ],
          ),
        ),
      ),
    );
  }
}