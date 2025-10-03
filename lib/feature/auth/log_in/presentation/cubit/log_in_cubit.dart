import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:calley/feature/auth/log_in/domain/entity/user_entity.dart';
import 'package:meta/meta.dart';

import '../../../../../core/router/string_router.dart';
import '../../domain/usecase/log_in_use_case.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  final LogInUseCase _logInUseCase;
  LogInCubit(this._logInUseCase) : super(LogInInitial());

  void logInWithCredentials({
    required String email,
    required String password,
  }) async {
    emit(LogInLoading());
    try {
      log("email: $email, password: $password");
      final user = await _logInUseCase.call(email, password);
      emit(LogInSuccess(user: user));
    } catch (e) {
      emit(LogInFailure(message: e.toString()));
    }
  }
}
