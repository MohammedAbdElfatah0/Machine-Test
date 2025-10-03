import '../repository/register_repository.dart';

class RegisterUseCase {
  final RegisterRepository registerRepository;
  RegisterUseCase({required this.registerRepository});

  Future<void> call({required String name, required String email, required String password}) {
    return registerRepository.register(name, email, password);
  }
}
