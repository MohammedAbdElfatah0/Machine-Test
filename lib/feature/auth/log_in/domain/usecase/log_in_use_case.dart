import 'package:calley/feature/auth/log_in/data/repository/log_in_repository_implement.dart';

import '../entity/user_entity.dart';

class LogInUseCase {
  final LogInRepositoryImplement logInRepository;

  LogInUseCase({required this.logInRepository});

  Future<UserEntity> call(String email, String password) async {
    return logInRepository.logInWithCredentials(email, password);
  }
}
