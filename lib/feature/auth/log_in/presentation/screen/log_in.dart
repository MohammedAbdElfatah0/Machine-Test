import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../data/api/api_remote_data_source.dart';
import '../../data/repository/log_in_repository_implement.dart';
import '../../domain/usecase/log_in_use_case.dart';
import '../cubit/log_in_cubit.dart';
import 'log_in_screen.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    final apiRemoteDataSource = ApiRemoteDataSourceImpl(client: http.Client());
    final logInRepository = LogInRepositoryImplement(apiRemoteDataSource: apiRemoteDataSource);
    final logInUseCase = LogInUseCase(logInRepository: logInRepository);
    return BlocProvider<LogInCubit>(
      create: (context) => LogInCubit(logInUseCase),
      child: const LogInScreen(),
    );
  }
}
