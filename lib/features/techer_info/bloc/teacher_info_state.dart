part of 'teacher_info_bloc.dart';

@immutable
sealed class TeacherInfoState {}

final class TeacherInfoInitial extends TeacherInfoState {}

final class TeacherInfoLoading extends TeacherInfoState {}

final class TeacherInfoSuccess extends TeacherInfoState {
  final TeacherResponseModel response;

  TeacherInfoSuccess({required this.response});
}

final class TeacherInfoError extends TeacherInfoState {
  final String message;

  TeacherInfoError({required this.message});
}
