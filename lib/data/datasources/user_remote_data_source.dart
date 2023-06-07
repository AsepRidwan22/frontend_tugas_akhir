// import 'dart:io';

// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:frontend_tugas_akhir/common/exception.dart';
// import 'package:frontend_tugas_akhir/domain/entities/user.dart';
// import 'package:frontend_tugas_akhir/data/models/model_user.dart';
// import 'package:frontend_tugas_akhir/domain/entities/user.dart';
// import 'package:frontend_tugas_akhir/domain/usecases/login_user.dart';
// import 'package:frontend_tugas_akhir/domain/usecases/register.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:frontend_tugas_akhir/common/config.dart';

// import '../../common/failure.dart';

abstract class UserRemoteDataSource {
  Future<String> loginUsers(String email, String password);
  Future<String> loginDokters(String email, String password);
  Future<String> registerUsers(String email, String name, String password);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final baseURL = Config().baseURL;
  final http.Client client;

  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<String> loginUsers(String email, String password) async {
    // print(baseURL);
    try {
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
        return responseData['access_token'];
      } else {
        final errorResponse = jsonDecode(response.body);
        final errorMessage = errorResponse['message'] ?? 'Failed to login';
        throw Exception(errorMessage);
      }
    } catch (e) {
      throw Exception('An error occurred while logging in: $e');
    }
  }

  @override
  Future<String> registerUsers(
      String email, String name, String password) async {
    // print("email datasource : $email");
    // print("name datasource : $name");
    // print("password datasource: $password");
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
      // print("register api berhasil");
      final responseData = jsonDecode(response.body);
      return responseData['message'];
    } else {
      throw Exception('Failed to register user');
    }
  }

  @override
  Future<String> loginDokters(String email, String password) async {
    // print("Dokter");
    // print("email datasource : $email");
    // print("password datasource: $password");
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
