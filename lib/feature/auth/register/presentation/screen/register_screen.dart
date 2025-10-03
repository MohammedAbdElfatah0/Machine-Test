import 'package:calley/feature/auth/register/presentation/screen/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../data/api/register_remote_data_soruce.dart';
import '../../data/repository/register_repository_implement.dart';
import '../../domain/use_cases/register_use_case.dart';
import '../cubit/register_cubit.dart';

class RegisterView extends StatelessWidget {
 const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final remote = RegisterRemoteDataSourceImpl(client: http.Client());
    final repo = RegisterRepositoryImplement(registerRemoteDataSoruce: remote);
    final useCase = RegisterUseCase(registerRepository: repo);
    return BlocProvider<RegisterCubit>(
      create: (_) => RegisterCubit(registerUseCase: useCase),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 42),
              child: RegisterScreen(),
            ),
          ),
        ),
      ),
    );
  }
}
