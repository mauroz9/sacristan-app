part of 'profile_info_bloc.dart';

@immutable
sealed class ProfileInfoState {}

final class ProfileInfoInitial extends ProfileInfoState {}

final class ProfileInfoLoading extends ProfileInfoState {}

final class ProfileInfoSuccess extends ProfileInfoState {
  final StudentResponseModel response;

  ProfileInfoSuccess({required this.response});
}

final class ProfileInfoError extends ProfileInfoState {
  final String message;

  ProfileInfoError({required this.message});
}
