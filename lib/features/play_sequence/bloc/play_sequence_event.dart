import 'package:flutter/foundation.dart';
import 'package:pantalla_login_ui/core/models/sequence_reproduction_stats.dart';

@immutable
sealed class PlaySequenceEvent {}

final class FetchSequenceDetails extends PlaySequenceEvent {
  final int sequenceId;

  FetchSequenceDetails(this.sequenceId);

}

final class StartRoutineSequence extends PlaySequenceEvent {
  final int sequenceId;

  StartRoutineSequence(this.sequenceId);
}

final class EndRoutineSequence extends PlaySequenceEvent {
  final SequenceReproductionStats reproductionStats;

  EndRoutineSequence(this.reproductionStats);
}

final class CompleteSequence extends PlaySequenceEvent {}