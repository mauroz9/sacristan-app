import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pantalla_login_ui/features/library_sequences/bloc/sequence_library_bloc.dart';
import 'widgets/library_sequence_card.dart';

class LibrarySequencesView extends StatefulWidget {
  const LibrarySequencesView({super.key});

  @override
  State<LibrarySequencesView> createState() => _LibrarySequencesViewState();
}

class _LibrarySequencesViewState extends State<LibrarySequencesView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      final state = context.read<SequenceLibraryBloc>().state;
      if (state is SequenceLibrarySuccess &&
          !state.isLoadingMore &&
          state.currentPage < state.totalPages - 1) {
        context.read<SequenceLibraryBloc>().add(
          LoadMoreSequences(
            page: state.currentPage + 1,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SequenceLibraryBloc, SequenceLibraryState>(
      builder: (context, state) {
        if (state is SequenceLibraryLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SequenceLibrarySuccess) {
          if (state.sequences.isEmpty) {
            return ListView(
                children: const [
                  SizedBox(height: 100),
                  Center(child: Text('No hay secuencias disponibles')),
                ],
              );
          }

          return ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              itemCount: state.sequences.length + (state.isLoadingMore ? 1 : 0),
              itemBuilder: (context, index) {
                // Show loading indicator at the end
                if (index == state.sequences.length) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                final sequence = state.sequences[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: LibrarySequenceCard(
                    index: index,
                    sequenceId: sequence.id,
                    title: sequence.title,
                    description: sequence.description,
                    category: sequence.category,
                    steps: sequence.steps,
                  ),
                );
              },
            );
        } else if (state is SequenceLibraryError) {
          return ListView(
              children: [
                const SizedBox(height: 100),
                Center(
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
              ],
            );
        }
        return const Center(
          child: Text('No hay secuencias disponibles'),
        );
      },
    );
  }
}