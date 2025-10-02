import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../data/api/otp_remote_data_source.dart';
import '../../data/repository/otp_repository_implement.dart';
import '../../domain/use_cases/send_otp_use_case.dart';
import '../../domain/use_cases/verify_otp_use_case.dart';
import '../cubit/otp_cubit.dart';
import 'otp_view.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>?;
    final email = args?['email'] ?? '';

    
    final remote = OtpRemoteDataSourceImpl(client: http.Client());
    final repo = OtpRepositoryImplement(otpRemoteDataSource: remote);
    final sendUC = SendOtpUseCase(otpRepository: repo);
    final verifyUC = VerifyOtpUseCase(otpRepository: repo);

    return BlocProvider<OtpCubit>(
      create: (_) => OtpCubit(sendOtpUseCase: sendUC, verifyOtpUseCase: verifyUC),
      child: Scaffold(
        body: OtpView(email: email),
      ),
    );
  }
}