import '../entity/user_entity.dart';
import '../repository/log_in_repository.dart';

class LogInUseCase {
  final LogInRepository logInRepository;

  LogInUseCase({required this.logInRepository});

  Future<UserEntity> call(String email, String password) async {
    return logInRepository.logInWithCredentials(email, password);
  }
}
