import 'dart:convert';
import 'dart:developer';
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
    log(body);
    final res = await client.post(uri, headers: _jsonHeaders, body: body);
    log("res:: ${res.body} and status code:: ${res.statusCode}");
    if (res.statusCode == 200) {
      final body = json.decode(res.body);
      log(body.toString());
      return body['verified'] == true;
    }
    if(res.statusCode == 400){
      throw Exception('User is verfied');
    }
    return false;
  }
}
