import '../../domain/entity/user_entity.dart';
import '../../domain/repository/log_in_repository.dart';
import '../api/api_remote_data_source.dart';

class LogInRepositoryImplement extends LogInRepository {
  final ApiRemoteDataSourceImpl apiRemoteDataSource;

  LogInRepositoryImplement({required this.apiRemoteDataSource});

  @override
  Future<UserEntity> logInWithCredentials(String email, String password) {
    return apiRemoteDataSource.logInWithCredentials(email, password);
  }
}
