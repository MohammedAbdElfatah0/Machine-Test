import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/entity/user_entity.dart';

abstract class ApiRemoteDataSource {
  Future<UserEntity> logInWithCredentials(String email, String password);
}

class ApiRemoteDataSourceImpl implements ApiRemoteDataSource {
  final http.Client client;

  ApiRemoteDataSourceImpl({required this.client});

  @override
  Future<UserEntity> logInWithCredentials(String email, String password) async {
    final url = Uri.parse('https://calley-api.onrender.com/api/v1/auth/login');
    final response = await client.post(
      url,
      body: {'email': email, 'password': password},
    );
    if (response.statusCode == 200) {
      return UserEntity.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to log in');
    }
  }
}
