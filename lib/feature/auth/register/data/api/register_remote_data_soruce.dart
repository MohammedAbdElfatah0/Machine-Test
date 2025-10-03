
import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class RegisterRemoteDataSoruce {
  Future<void> register(String name, String email, String password);
}

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSoruce {
  
  final url = "https://mock-api.calleyacd.com/api/auth";
  final http.Client client;
  RegisterRemoteDataSourceImpl({required this.client});
  final Map<String, String> _jsonHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  @override
  Future<void> register(String name, String email, String password) async {
    final uri = Uri.parse('$url/register');
    final body = jsonEncode({'username': name, 'email': email, 'password': password});
    final res =await client.post(uri, headers: _jsonHeaders, body: body);
    if (res.statusCode < 200 || res.statusCode >= 300) {
      // for debugging: print response body
      throw Exception('Register failed (${res.statusCode}): ${res.body}');
    }
    }
}