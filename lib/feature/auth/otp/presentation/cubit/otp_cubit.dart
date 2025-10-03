import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/send_otp_use_case.dart';
import '../../domain/use_cases/verify_otp_use_case.dart';
import 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  final SendOtpUseCase sendOtpUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;

  OtpCubit({required this.sendOtpUseCase, required this.verifyOtpUseCase})
    : super(OtpInitial());

  Future<void> send(String email) async {
    emit(OtpLoading());
    try {
      await sendOtpUseCase(email);
      emit(OtpSent());
    } catch (e) {
      emit(OtpError('Failed to send OTP'));
    }
  }

  Future<void> resend(String email) async {
    return send(email);
  }

  Future<void> verify(String email, String otp) async {
    emit(OtpLoading());
    try {
      log("emit(OtpVerified());");
       await verifyOtpUseCase(email, otp);
      emit(OtpVerified());
    } catch (e) {
      emit(OtpError('Verification failed'));
    }
  }
}
