import 'package:flutter/foundation.dart';
import 'package:pantalla_login_ui/core/models/sequence_response_model.dart';

@immutable
sealed class PlaySequenceState {}

final class PlaySequenceInitial extends PlaySequenceState {}

final class PlaySequenceLoading extends PlaySequenceState {}

final class PlaySequenceLoaded extends PlaySequenceState {
  final SequenceResponseModel sequence;
  final int? reproductionId;

  PlaySequenceLoaded(this.sequence, {this.reproductionId});
}

final class PlaySequenceError extends PlaySequenceState {
  final String message;

  PlaySequenceError(this.message);
}

final class PlaySequenceStarted extends PlaySequenceState {
  final int reproductionId;

  PlaySequenceStarted(this.reproductionId);
}

final class PlaySequenceCompleted extends PlaySequenceState {}

final class PlayLibraryCompleted extends PlaySequenceState {}

final class PlaySequenceCompletionError extends PlaySequenceState {
  final String message;

  PlaySequenceCompletionError(this.message);
}