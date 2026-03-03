part of 'sequences_to_do_bloc.dart';

@immutable
sealed class SequencesToDoEvent {}

final class FetchPendingSequences extends SequencesToDoEvent {}
