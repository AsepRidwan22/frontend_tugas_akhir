import 'package:frontend_tugas_akhir/data/helper/shared_preferences_helper.dart';
import 'package:frontend_tugas_akhir/data/models/model_kesehatan.dart';
// import 'package:frontend_tugas_akhir/domain/entities/kesehatan.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:frontend_tugas_akhir/common/config.dart';

abstract class KesehatanRemoteDataSource {
  Future<ModelKesehatan> kesehatan();
}

class KesehatanRemoteDataSourceImpl implements KesehatanRemoteDataSource {
  final baseURL = Config().baseURL;
  // final http.Client client;
  SharedPreferencesHelper sharedPreferencesHelper = SharedPreferencesHelper();

  // KesehatanRemoteDataSourceImpl({
  //   // required this.client,
  //   this.sharedPreferencesHelper,
  // });

  @override
  Future<ModelKesehatan> kesehatan() async {
    //buatkan variabel untuk menampung token yang diambil dari shared preferences
    final savedToken = await sharedPreferencesHelper.getToken();
    //kenapa code diatas gagal mengambil token
    // print('object: $savedToken');
    final response = await http.get(
      Uri.parse('$baseURL/pasien/kesehatan'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $savedToken',
      },
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      // print(responseData['data'].toString());
      return ModelKesehatan.fromJson(responseData['data']);
    } else {
      final errorResponse = jsonDecode(response.body);
      final errorMessage = errorResponse['message'] ?? 'Failed to login';
      throw Exception(errorMessage);
    }
  }
}
