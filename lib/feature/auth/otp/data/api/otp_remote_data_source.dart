import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class OtpRemoteDataSource {
  Future<void> sendOtp(String email);
  Future<bool> verifyOtp(String email, String otp);
}

class OtpRemoteDataSourceImpl implements OtpRemoteDataSource {
  final http.Client client;
  String baseUrl = "https://mock-api.calleyacd.com/api/auth";
  Map<String, String> get _jsonHeaders => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  OtpRemoteDataSourceImpl({required this.client});

  @override
  Future<void> sendOtp(String email) async {
    final uri = Uri.parse('$baseUrl/send-otp');
    final body = jsonEncode({'email': email});
    final res = await client.post(uri, headers: _jsonHeaders, body: body);
    if (res.statusCode < 200 || res.statusCode >= 300) {
      // for debugging: print response body
      throw Exception('Send OTP failed (${res.statusCode}): ${res.body}');
    }
  }

  @override
  Future<bool> verifyOtp(String email, String otp) async {
    final uri = Uri.parse('$baseUrl/verify-otp');
    final body = jsonEncode({'email': email, 'otp': otp});
    final res = await client.post(uri, headers: _jsonHeaders, body: body);
    if (res.statusCode == 200) {
      final body = json.decode(res.body);
      return body['verified'] == true;
    }
    return false;
  }
}
