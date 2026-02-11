import 'package:flutter/material.dart';
import 'personalized_widget/library_sequence_card.dart';

class LibrarySequencesView extends StatefulWidget {
  const LibrarySequencesView({super.key});

  @override
  State<LibrarySequencesView> createState() => _LibrarySequencesViewState();
}

class _LibrarySequencesViewState extends State<LibrarySequencesView> {
  // Lista de ejemplo de secuencias
  final List<Map<String, dynamic>> sequences = [
    {
      'title': 'Misa Dominical',
      'description': 'Secuencia completa para la celebración de la misa dominical',
      'category': 'Misa',
      'steps': 12,
    },
    {
      'title': 'Bautismo',
      'description': 'Pasos para la preparación y celebración del sacramento del bautismo',
      'category': 'Sacramento',
      'steps': 8,
    },
    {
      'title': 'Comunión',
      'description': 'Secuencia para la primera comunión de los niños',
      'category': 'Sacramento',
      'steps': 10,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      itemCount: sequences.length,
      itemBuilder: (context, index) {
        final sequence = sequences[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: LibrarySequenceCard(
            title: sequence['title'],
            description: sequence['description'],
            category: sequence['category'],
            steps: sequence['steps'],
          ),
        );
      },
    );
  }
}