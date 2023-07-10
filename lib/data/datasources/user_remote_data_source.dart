import 'package:frontend_tugas_akhir/data/helper/shared_preferences_helper.dart';
// import 'package:frontend_tugas_akhir/data/models/model_kesehatan.dart';
// import 'package:frontend_tugas_akhir/domain/entities/kesehatan.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:frontend_tugas_akhir/common/config.dart';

abstract class UserRemoteDataSource {
  Future<String> loginUsers(String email, String password);
  Future<String> loginDokters(String email, String password);
  Future<String> registerUsers(String email, String name, String password);
  // Future<ModelKesehatan> kesehatan();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final baseURL = Config().baseURL;
  final http.Client client;
  final secureStorage = SecureStorageHelper();

  UserRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<String> loginUsers(String email, String password) async {
    final response = await client.post(
      Uri.parse('$baseURL/pasien/auth/login'),
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final token = responseData['access_token'];
      await secureStorage.setToken(token);
      return responseData['message'];
    } else {
      final errorResponse = jsonDecode(response.body);
      final errorMessage = errorResponse['message'] ?? 'Failed to login';
      throw Exception(errorMessage);
    }
  }

  @override
  Future<String> registerUsers(
      String email, String name, String password) async {
    final response = await client.post(
      Uri.parse('$baseURL/pasien/auth/register'),
      body: jsonEncode({
        'email': email,
        'name': name,
        'password': password,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      return responseData['message'];
    } else {
      throw Exception('Failed to register user');
    }
  }

  @override
  Future<String> loginDokters(String email, String password) async {
    final response = await client.post(
      Uri.parse('$baseURL/dokter/auth/login'),
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData['access_token'];
    } else {
      throw Exception('Failed to login');
    }
  }
}
