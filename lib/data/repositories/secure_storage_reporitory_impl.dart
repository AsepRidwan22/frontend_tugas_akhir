import 'package:frontend_tugas_akhir/data/datasources/secure_storage_data_source.dart';

class SourceStorageReopsitoryImpl {
  final SecureStorageDataSource secureStorageDataSource;

  SourceStorageReopsitoryImpl(this.secureStorageDataSource);

  Future<String?> getToken() async {
    return secureStorageDataSource.getToken();
  }
}
