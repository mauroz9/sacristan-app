import 'package:flutter/material.dart';
import 'package:pantalla_login_ui/features/play_sequence/ui/play_sequence.dart';

class PlaySequencesView extends StatelessWidget {
  const PlaySequencesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(255, 238, 246, 255),
              Color.fromARGB(255, 238, 242, 255),
            ],
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: PlaySequencesPage(),
      ),
    );
  }
}