import 'package:flutter/foundation.dart';

@immutable
sealed class PlaySequenceEvent {}

final class FetchSequenceDetails extends PlaySequenceEvent {
  final int sequenceId;

  FetchSequenceDetails(this.sequenceId);
}