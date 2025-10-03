import 'package:calley/feature/auth/otp/data/repository/otp_repository_implement.dart';

class VerifyOtpUseCase {
  final OtpRepositoryImplement otpRepository;

  VerifyOtpUseCase({required this.otpRepository});

  Future<bool> call(String email, String otp) async {
    return await otpRepository.verifyOtp(email, otp);
  }
}
