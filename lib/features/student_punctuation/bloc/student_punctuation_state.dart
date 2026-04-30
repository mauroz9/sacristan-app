part of 'student_punctuation_bloc.dart';

@immutable
sealed class StudentPunctuationState {}

final class StudentPunctuationInitial extends StudentPunctuationState {}

final class StudentPunctuationLoading extends StudentPunctuationState {}

final class StudentPunctuationSuccess extends StudentPunctuationState {
  final StudentPunctuationResponseModel response;

  StudentPunctuationSuccess({required this.response});
}

final class StudentPunctuationError extends StudentPunctuationState {
  final String message;

  StudentPunctuationError({required this.message});
}
