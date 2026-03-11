part of 'sequence_library_bloc.dart';

@immutable
sealed class SequenceLibraryState {}

final class SequenceLibraryInitial extends SequenceLibraryState {}

final class SequenceLibraryLoading extends SequenceLibraryState {}

final class SequenceLibrarySuccess extends SequenceLibraryState {
  final List<LibrarySequenceResponseModel> sequences;
  final int currentPage;
  final int totalPages;
  final bool isLoadingMore;

  SequenceLibrarySuccess({
    required this.sequences,
    this.currentPage = 0,
    this.totalPages = 0,
    this.isLoadingMore = false,
  });

  SequenceLibrarySuccess copyWith({
    List<LibrarySequenceResponseModel>? sequences,
    int? currentPage,
    int? totalPages,
    bool? isLoadingMore,
  }) {
    return SequenceLibrarySuccess(
      sequences: sequences ?? this.sequences,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

final class SequenceLibraryError extends SequenceLibraryState {
  final String message;

  SequenceLibraryError({required this.message});
}
