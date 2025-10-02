abstract class OtpRepository {
  Future<void> sendOtp(String email);
  Future<bool> verifyOtp(String email, String otp);
}
