import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pantalla_login_ui/core/services/sequence_service.dart';
import 'package:pantalla_login_ui/features/library_sequences/bloc/sequence_library_bloc.dart';
import 'widgets/library_sequence_card.dart';

class LibrarySequencesView extends StatefulWidget {
  const LibrarySequencesView({super.key});

  @override
  State<LibrarySequencesView> createState() => _LibrarySequencesViewState();
}

class _LibrarySequencesViewState extends State<LibrarySequencesView> {
  Future<void> _onRefresh() async {
    context.read<SequenceLibraryBloc>().add(FetchSequences());
    // Wait for the state to change
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SequenceLibraryBloc(SequenceService())..add(FetchSequences()),
      child: BlocBuilder<SequenceLibraryBloc, SequenceLibraryState>(
        builder: (context, state) {
          if (state is SequenceLibraryLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SequenceLibrarySuccess) {
      
            if (state.sequences.isEmpty) {
              return RefreshIndicator(
                onRefresh: _onRefresh,
                child: const Center(
                  child: Text('No hay secuencias disponibles'),
                ),
              );
            }
      
            return RefreshIndicator(
              onRefresh: _onRefresh,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                itemCount: state.sequences.length,
                itemBuilder: (context, index) {
                  final sequence = state.sequences[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: LibrarySequenceCard(
                      title: sequence.title,
                      description: sequence.description,
                      category: sequence.category,
                      steps: sequence.steps,
                    ),
                  );
                },
              ),
            );
          } else if (state is SequenceLibraryError) {
            return RefreshIndicator(
              onRefresh: _onRefresh,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.message),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<SequenceLibraryBloc>().add(FetchSequences());
                      },
                      child: const Text('Reintentar'),
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(
            child: Text('No hay secuencias disponibles'),
          );
        },
      ),
    );
  }
}