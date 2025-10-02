import 'package:calley/feature/auth/otp/domain/repository/otp_repository.dart';

class SendOtpUseCase {
  final OtpRepository otpRepository;

  SendOtpUseCase({required this.otpRepository});

  Future<void> call(String email) async {
    return await otpRepository.sendOtp(email);  
  }
}
