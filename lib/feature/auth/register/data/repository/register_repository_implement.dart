import '../../domain/repository/register_repository.dart';
import '../api/register_remote_data_soruce.dart';

class RegisterRepositoryImplement implements RegisterRepository {
  final RegisterRemoteDataSoruce registerRemoteDataSoruce;
  RegisterRepositoryImplement({required this.registerRemoteDataSoruce});

  @override
  Future<void> register(String name, String email, String password) {
    return registerRemoteDataSoruce.register(name, email, password);
  }
}