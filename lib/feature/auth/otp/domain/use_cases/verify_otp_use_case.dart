import '../repository/otp_repository.dart';

class VerifyOtpUseCase {
  final OtpRepository otpRepository;

  VerifyOtpUseCase({required this.otpRepository});

  Future<bool> call(String email, String otp) async {
    return await otpRepository.verifyOtp(email, otp);
  }
}