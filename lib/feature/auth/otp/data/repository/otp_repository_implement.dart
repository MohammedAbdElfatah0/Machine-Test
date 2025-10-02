import '../../domain/repository/otp_repository.dart';
import '../api/otp_remote_data_source.dart';

class OtpRepositoryImplement implements OtpRepository {
  final OtpRemoteDataSource otpRemoteDataSource;
  OtpRepositoryImplement({required this.otpRemoteDataSource});
  @override
  Future<void> sendOtp(String email) {
    return otpRemoteDataSource.sendOtp(email);
  }

  @override
  Future<bool> verifyOtp(String email, String otp) {
    return otpRemoteDataSource.verifyOtp(email, otp);
  }
}
