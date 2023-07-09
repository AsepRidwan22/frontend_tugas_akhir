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
  final SharedPreferencesHelper? sharedPreferencesHelper;

  UserRemoteDataSourceImpl({
    required this.client,
    this.sharedPreferencesHelper,
  });

  @override
  Future<String> loginUsers(String email, String password) async {
    print('email: $email');
    print('password: $password');
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
      // print('token hasil login: $token');
      // Simpan token ke shared preferences
      await SharedPreferencesHelper().setToken(token);

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
    // print('email: $email');
    // print('name: $name');
    // print('password: $password');
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
      print('responseData: ${responseData['message']}');
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
      // print("login api berhasil");
      final responseData = jsonDecode(response.body);
      // print("$responseData['access_token']");
      return responseData['access_token'];
    } else {
      throw Exception('Failed to login');
    }
  }
}
