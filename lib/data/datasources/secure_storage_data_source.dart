import 'package:frontend_tugas_akhir/data/helper/shared_preferences_helper.dart';
import 'package:frontend_tugas_akhir/domain/repositories/secure_storage_repository.dart';

class SecureStorageDataSource implements SecureStorageRepository {
  final SecureStorageHelper secureStorageHelper;

  SecureStorageDataSource(this.secureStorageHelper);

  @override
  Future<String?> getToken() async {
    return secureStorageHelper.getToken();
  }
}
