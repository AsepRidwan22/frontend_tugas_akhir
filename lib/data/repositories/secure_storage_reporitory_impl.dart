import 'package:frontend_tugas_akhir/data/datasources/secure_storage_data_source.dart';

class SourceStorageReopsitoryImpl {
  final SecureStorageDataSource secureStorageDataSource;

  SourceStorageReopsitoryImpl(this.secureStorageDataSource);

  Future<bool?> getToken() async {
    final token = await secureStorageDataSource.getToken();
    return token != '';
  }
}
