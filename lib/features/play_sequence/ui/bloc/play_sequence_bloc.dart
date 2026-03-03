import 'package:bloc/bloc.dart';
import 'package:pantalla_login_ui/core/services/sequence_service.dart';
import 'package:pantalla_login_ui/features/play_sequence/ui/bloc/play_sequence_event.dart';
import 'package:pantalla_login_ui/features/play_sequence/ui/bloc/play_sequence_state.dart';

class PlaySequenceBloc extends Bloc<PlaySequenceEvent, PlaySequenceState> {
  PlaySequenceBloc(SequenceService sequenceService) : super(PlaySequenceInitial()) {
    on<FetchSequenceDetails>((event, emit) async{
      emit(PlaySequenceLoading());
      
      try{
        final sequence = await sequenceService.getSequenceDetails(event.sequenceId);
        emit(PlaySequenceLoaded(sequence));
      }catch (e){
        emit(PlaySequenceError(e.toString()));
      }
    });
  }
}
