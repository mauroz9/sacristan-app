import 'package:flutter/material.dart';
import 'package:pantalla_login_ui/features/play_sequence/ui/widgets/header_info.dart';

class PlaySequencePage extends StatefulWidget {
  const PlaySequencePage({super.key});

  @override
  State<PlaySequencePage> createState() => _PlaySequencePageState();
}

class _PlaySequencePageState extends State<PlaySequencePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 205,
          decoration: BoxDecoration(
            color: const Color(0xFF1F3C8B),
            border: BoxBorder.fromLTRB(
              bottom: BorderSide(
                width: 7,
                color: const Color.fromARGB(255, 240, 200, 56),
              ),
            ),
          ),
          child: SafeArea(child: Padding(
            padding: const EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 0),
            child: HeaderInfo(totalSteps: 5, currentStep: 2, title: "Lavado de Manos",),
          )),
        ),
        Expanded(
          child: Container() 
        ),
        Container(
          color: Colors.white,
          height: 110,
        )
      ],
    );
  }
}