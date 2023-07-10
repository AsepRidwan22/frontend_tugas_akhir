import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  static SecureStorageHelper? _secureStorageHelper;
  SecureStorageHelper._instance() {
    _secureStorageHelper = this;
  }

  factory SecureStorageHelper() =>
      _secureStorageHelper ?? SecureStorageHelper._instance();

  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  static const String _tokenKey = '';

  Future<String?> getToken() async {
    try {
      final token = await _secureStorage.read(key: _tokenKey);
      return token;
    } catch (e) {
      return null;
    }
  }

  Future<bool> setToken(String token) async {
    try {
      await _secureStorage.write(key: _tokenKey, value: token);
      return true;
    } catch (e) {
      return false;
    }
  }
}
