import 'package:flutter/material.dart';

class PlaySequencesPage extends StatefulWidget {
  const PlaySequencesPage({super.key});

  @override
  State<PlaySequencesPage> createState() => _PlaySequencesPageState();
}

class _PlaySequencesPageState extends State<PlaySequencesPage> {
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