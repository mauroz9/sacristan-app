import 'package:flutter/material.dart';
import 'package:pantalla_login_ui/features/profile_info/ui/profile_info.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 225,
          decoration: BoxDecoration(
            color: const Color(0xFF1F3C8B),
            border: BoxBorder.fromLTRB(
              bottom: BorderSide(
                width: 7,
                color: const Color.fromARGB(255, 240, 200, 56),
              ),
            ),
          ),
          child: SafeArea(
            child: ProfileInfo(),
          ),
        ),
      ],
    );
  }
}