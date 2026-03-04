import 'package:flutter/foundation.dart';

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
  final int reproductionId;

  EndRoutineSequence(this.reproductionId);
}

final class CompleteSequence extends PlaySequenceEvent {}