import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pantalla_login_ui/core/models/library_sequence_response_model.dart';
import 'package:pantalla_login_ui/core/services/sequence_service.dart';

part 'sequence_library_event.dart';
part 'sequence_library_state.dart';

class SequenceLibraryBloc
    extends Bloc<SequenceLibraryEvent, SequenceLibraryState> {
  final SequenceService _sequenceService;

  SequenceLibraryBloc(this._sequenceService)
      : super(SequenceLibraryInitial()) {
    on<FetchSequences>((event, emit) async {
      emit(SequenceLibraryLoading());

      try {
        final page = await _sequenceService.getSequences(
          event.categoryId?.toString(),
          event.searchQuery,
          event.page,
        );
        emit(SequenceLibrarySuccess(
          sequences: page.content,
          currentPage: page.page.number,
          totalPages: page.page.totalPages,
          isLoadingMore: false,
        ));
      } catch (e) {
        emit(SequenceLibraryError(
            message: "Error al cargar las secuencias: $e"));
      }
    });

    on<LoadMoreSequences>((event, emit) async {
      if (state is SequenceLibrarySuccess) {
        final currentState = state as SequenceLibrarySuccess;

        // Don't load more if we're already at the last page
        if (currentState.currentPage >= currentState.totalPages - 1) {
          return;
        }

        emit(currentState.copyWith(isLoadingMore: true));

        try {
          final page = await _sequenceService.getSequences(
            event.categoryId?.toString(),
            event.searchQuery,
            event.page,
          );
          emit(SequenceLibrarySuccess(
            sequences: [...currentState.sequences, ...page.content],
            currentPage: page.page.number,
            totalPages: page.page.totalPages,
            isLoadingMore: false,
          ));
        } catch (e) {
          emit(currentState.copyWith(isLoadingMore: false));
        }
      }
    });
  }
}
