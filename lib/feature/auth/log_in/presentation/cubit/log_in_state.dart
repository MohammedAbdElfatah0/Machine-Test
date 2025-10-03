part of 'log_in_cubit.dart';

@immutable
sealed class LogInState {}

final class LogInInitial extends LogInState {}

final class LogInLoading extends LogInState {}

final class LogInSuccess extends LogInState {
  final UserEntity user;

  LogInSuccess({required this.user});
}

final class LogInFailure extends LogInState {
  final String message;

  LogInFailure({required this.message});
}
