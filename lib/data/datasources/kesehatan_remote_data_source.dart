import 'package:frontend_tugas_akhir/data/helper/shared_preferences_helper.dart';
import 'package:frontend_tugas_akhir/data/models/model_kesehatan.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:frontend_tugas_akhir/common/config.dart';

abstract class KesehatanRemoteDataSource {
  Future<ModelKesehatan> kesehatan();
}

class KesehatanRemoteDataSourceImpl implements KesehatanRemoteDataSource {
  final baseURL = Config().baseURL;
  final secureStorage = SecureStorageHelper();

  @override
  Future<ModelKesehatan> kesehatan() async {
    final savedToken = await secureStorage.getToken();
    final response = await http.get(
      Uri.parse('$baseURL/pasien/kesehatan'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $savedToken',
      },
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return ModelKesehatan.fromJson(responseData['data']);
    } else {
      final errorResponse = jsonDecode(response.body);
      final errorMessage = errorResponse['message'] ?? 'Failed to login';
      throw Exception(errorMessage);
    }
  }
}
