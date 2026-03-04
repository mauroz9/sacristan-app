import 'package:bloc/bloc.dart';
import 'package:pantalla_login_ui/core/services/reproduction_service.dart';
import 'package:pantalla_login_ui/core/services/sequence_service.dart';
import 'package:pantalla_login_ui/features/play_sequence/bloc/play_sequence_event.dart';
import 'package:pantalla_login_ui/features/play_sequence/bloc/play_sequence_state.dart';

class PlaySequenceBloc extends Bloc<PlaySequenceEvent, PlaySequenceState> {
  PlaySequenceBloc(SequenceService sequenceService, ReproductionService reproductionService) : super(PlaySequenceInitial()) {
    on<FetchSequenceDetails>((event, emit) async{
      emit(PlaySequenceLoading());
      
      try{
        final sequence = await sequenceService.getSequenceDetails(event.sequenceId);
        emit(PlaySequenceLoaded(sequence));
      }catch (e){
        emit(PlaySequenceError(e.toString()));
      }
    });

    on<StartRoutineSequence>((event, emit) async {
      try {
        final reproductionId = await reproductionService.startReproduction(event.sequenceId);
        if (state is PlaySequenceLoaded) {
          final currentState = state as PlaySequenceLoaded;
          emit(PlaySequenceLoaded(currentState.sequence, reproductionId: reproductionId));
        } else {
          emit(PlaySequenceStarted(reproductionId));
        }
      } catch (e) {
        emit(PlaySequenceError(e.toString()));
      }
    });

    on<EndRoutineSequence>((event, emit) async {
      try {
        await reproductionService.endReproduction(event.reproductionId);
        emit(PlaySequenceCompleted());
      } catch (e) {
        emit(PlaySequenceCompletionError(e.toString()));
      }
    });

    on<CompleteSequence> ((event, emit) {
      emit(PlayLibraryCompleted());
    });
  }

}
