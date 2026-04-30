part of 'student_punctuation_bloc.dart';

@immutable
sealed class StudentPunctuationEvent {}

final class StudentPunctuationRequested extends StudentPunctuationEvent {}
