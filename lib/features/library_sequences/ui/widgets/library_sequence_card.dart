import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pantalla_login_ui/core/services/sequence_service.dart';
import 'package:pantalla_login_ui/features/play_sequence/ui/bloc/play_sequence_bloc.dart';
import 'package:pantalla_login_ui/features/play_sequence/ui/bloc/play_sequence_event.dart';
import 'package:pantalla_login_ui/features/play_sequence/ui/play_sequence.dart';

class LibrarySequenceCard extends StatelessWidget {
  const LibrarySequenceCard({super.key, required this.sequenceId, required this.title, required this.description, required this.category, required this.steps});

  final int sequenceId;
  final String title;
  final String description;
  final String category;
  final int steps;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(50),
            offset: Offset(0, 10),
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFF101828)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              description,
              style: TextStyle(color: Color(0xFF4A5565), fontSize: 16),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 15,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF4C63A2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      category,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Row(
                  spacing: 5,
                  children: [
                    Text("$steps", style: TextStyle(color: Color(0xFF4A5565), fontSize: 16),),
                    Text(
                      "pasos",
                      style: TextStyle(color: Color(0xFF4A5565), fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => PlaySequenceBloc(SequenceService())
                        ..add(FetchSequenceDetails(sequenceId)),
                      child: const PlaySequencePage(),
                    ),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  const Color(0xFF1F3C8B),
                ),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50)),
              ),
              child: Row(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.play_arrow_rounded, color: Colors.white, size: 30),
                  Text(
                    "Reproducir",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
