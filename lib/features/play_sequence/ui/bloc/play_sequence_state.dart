import 'package:flutter/foundation.dart';
import 'package:pantalla_login_ui/core/models/sequence_response_model.dart';

@immutable
sealed class PlaySequenceState {}

final class PlaySequenceInitial extends PlaySequenceState {}

final class PlaySequenceLoading extends PlaySequenceState {}

final class PlaySequenceLoaded extends PlaySequenceState {
  final SequenceResponseModel sequence;

  PlaySequenceLoaded(this.sequence);
}

final class PlaySequenceError extends PlaySequenceState {
  final String message;

  PlaySequenceError(this.message);
}