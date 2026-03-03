part of 'teacher_info_bloc.dart';

@immutable
sealed class TeacherInfoEvent {}

final class TeacherInfoRequested extends TeacherInfoEvent {}
