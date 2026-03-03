import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pantalla_login_ui/core/models/principal_sequence_response_model.dart';
import 'package:pantalla_login_ui/core/services/routines_service.dart';

part 'sequences_to_do_event.dart';
part 'sequences_to_do_state.dart';

class SequencesToDoBloc extends Bloc<SequencesToDoEvent, SequencesToDoState> {
  final RoutinesService _routinesService;

  SequencesToDoBloc(this._routinesService) : super(SequencesToDoInitial()) {
    on<FetchPendingSequences>((event, emit) async {
      emit(SequencesToDoLoading());

      try {
        final sequences = await _routinesService.getPendingSequences();
        emit(SequencesToDoSuccess(sequences: sequences.content));
      } catch (e) {
        emit(SequencesToDoError(
            message: "Error al cargar las secuencias pendientes: $e"));
      }
    });
  }
}
