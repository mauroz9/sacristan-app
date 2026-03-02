part of 'sequence_library_bloc.dart';

@immutable
sealed class SequenceLibraryState {}

final class SequenceLibraryInitial extends SequenceLibraryState {}

final class SequenceLibraryLoading extends SequenceLibraryState {}

final class SequenceLibrarySuccess extends SequenceLibraryState {
  final List<LibrarySequenceResponseModel> sequences;

  SequenceLibrarySuccess({required this.sequences});
}

final class SequenceLibraryError extends SequenceLibraryState {
  final String message;

  SequenceLibraryError({required this.message});
}
