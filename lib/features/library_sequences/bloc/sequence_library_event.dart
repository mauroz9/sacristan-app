part of 'sequence_library_bloc.dart';

@immutable
sealed class SequenceLibraryEvent {}

final class FetchSequences extends SequenceLibraryEvent {
  final int? categoryId;
  final String? searchQuery;
  final int page;

  FetchSequences({this.categoryId, this.searchQuery, this.page = 0});
}

final class LoadMoreSequences extends SequenceLibraryEvent {
  final int? categoryId;
  final String? searchQuery;
  final int page;

  LoadMoreSequences({this.categoryId, this.searchQuery, required this.page});
}
