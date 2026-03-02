part of 'sequence_library_bloc.dart';

@immutable
sealed class SequenceLibraryEvent {}

final class FetchSequences extends SequenceLibraryEvent {
  final int? categoryId;

  FetchSequences({this.categoryId});
}
