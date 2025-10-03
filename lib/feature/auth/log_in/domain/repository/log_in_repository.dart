import '../entity/user_entity.dart';

abstract class LogInRepository {
  Future<UserEntity> logInWithCredentials(String email, String password);
}