import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/register_use_case.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;
  RegisterCubit({required this.registerUseCase}) : super(RegisterInitial());

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(RegisterLoading());
    try {
      await registerUseCase(name: name, email: email, password: password);
      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterError('Failed to register'));
    }
  }
}
