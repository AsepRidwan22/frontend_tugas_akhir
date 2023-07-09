import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferencesHelper? _sharedpreferencesHelper;
  SharedPreferencesHelper._instance() {
    _sharedpreferencesHelper = this;
  }

  factory SharedPreferencesHelper() =>
      _sharedpreferencesHelper ?? SharedPreferencesHelper._instance();

  static SharedPreferences? _preferences;

  Future<SharedPreferences?> get preferences async {
    _preferences ??= await _initDb();
    return _preferences;
  }

  static const String _isRememberPref = 'isRememberMe';
  static const String _tokenPref = 'token';

  Future<SharedPreferences> _initDb() async {
    final pref = await SharedPreferences.getInstance();
    return pref;
  }

  Future<bool> isRememberMe() async {
    final pref = await preferences;
    final value = pref?.getBool(_isRememberPref) ?? false;
    return value;
  }

  Future<bool> setRememberMe(bool remember) async {
    final pref = await preferences;
    final value = await pref!.setBool(_isRememberPref, remember);
    return value;
  }

  Future<String> getToken() async {
    try {
      final pref = await preferences;
      final tokenz = pref?.getString(_tokenPref) ?? '';
      print('get token: $tokenz');
      return tokenz;
    } catch (e) {
      print('get token: $e');
      return '';
    }
    // final token = pref?.getString(_tokenPref);
    // print('get token: $token');
    // if (token != null) {
    //   return token;
    // } else {
    //   throw Exception(
    //       "Token is null"); // Atau gunakan nilai default sesuai kebutuhan
    // }
  }

  Future<bool> setToken(String token) async {
    print('token tersimpan: $token');
    try {
      final pref = await preferences;
      final value = await pref?.setString(_tokenPref, token);

      print('token tersimpan: $value');
      // final tokenz = pref?.getString(_tokenPref) ?? '';
      // print('get token: $tokenz');
      return value ?? false;
    } catch (e) {
      print('token tersimpan: $e');
      return false;
    }
  }
}
