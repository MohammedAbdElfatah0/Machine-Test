import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:brotli/brotli.dart' as brotli;
import '../../domain/entity/user_entity.dart';

abstract class ApiRemoteDataSource {
  Future<UserEntity> logInWithCredentials(String email, String password);
}

class ApiRemoteDataSourceImpl implements ApiRemoteDataSource {
  final http.Client client;

  ApiRemoteDataSourceImpl({required this.client});

  @override
  Future<UserEntity> logInWithCredentials(String email, String password) async {
    final url = "https://mock-api.calleyacd.com/api/auth/login";
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'User-Agent': 'MyApp/1.0',
      'Accept-Encoding': 'gzip, deflate, br',
    };
    final body = jsonEncode({'email': email, 'password': password});

    log("=== logInWithCredentials START ===");
    log("Request Method: POST");
    log("Request URL: $url");
    log("Request Headers: $headers");
    log("Request Body: $body");

    try {
      final response = await client.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      log("Response StatusCode: ${response.statusCode}");
      log("Response Headers: ${response.headers}");

      String responseBody;
      if (response.headers['content-encoding'] == 'br') {
        final decodedBytes = brotli.brotliDecode(response.bodyBytes);
        responseBody = utf8.decode(decodedBytes);
      } else {
        responseBody = response.body;
      }

      log("Response Body: $responseBody");
      log("=== logInWithCredentials END ===");

      if (response.statusCode == 200) {
        final decoded = jsonDecode(responseBody);
        log("Response decoded: $decoded");
        return UserEntity.fromJson(decoded);
      } else if (response.statusCode == 404) {
        throw Exception('user not found');
      } else if (response.statusCode == 401) {
        throw Exception('Invalid credentials');
      } else {
        throw Exception(
          'Failed to log in. Status: ${response.statusCode}. Body: $responseBody',
        );
      }
    } catch (e, st) {
      log("Exception in logInWithCredentials: $e");
      log(st.toString());
      rethrow;
    }
  }
}
