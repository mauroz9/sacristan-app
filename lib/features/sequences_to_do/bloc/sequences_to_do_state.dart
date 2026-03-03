part of 'sequences_to_do_bloc.dart';

@immutable
sealed class SequencesToDoState {}

final class SequencesToDoInitial extends SequencesToDoState {}

final class SequencesToDoLoading extends SequencesToDoState {}

final class SequencesToDoSuccess extends SequencesToDoState {
  final List<PrincipalSequenceResponseModel> sequences;

  SequencesToDoSuccess({required this.sequences});
}

final class SequencesToDoError extends SequencesToDoState {
  final String message;

  SequencesToDoError({required this.message});
}
