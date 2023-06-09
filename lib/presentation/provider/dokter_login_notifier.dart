import 'package:frontend_tugas_akhir/common/state_enum.dart';
import 'package:frontend_tugas_akhir/domain/usecases/login_user.dart';
import 'package:flutter/foundation.dart';

class DokterLoginNotifier extends ChangeNotifier {
  final LoginDokters loginDokters;
  // final String role;

  DokterLoginNotifier({required this.loginDokters});

  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool _rememberMe = false;
  bool get rememberMe => _rememberMe;

  set rememberMe(bool value) {
    _rememberMe = value;
    notifyListeners();
  }

  String _message = '';
  String get message => _message;

  Future<void> login(String? email, String? password) async {
    // print("masuk ke provider");
    _state = RequestState.loading;
    notifyListeners();

    final result = await loginDokters.execute(email!, password!);
    result.fold((failure) {
      // print("masuk ke kondisi loading provider");
      _message = failure.message;
      _state = RequestState.error;
      notifyListeners();
    }, (failure) {
      // print("masuk ke kondisi loaded provider");
      _state = RequestState.success;
      notifyListeners();
    });
  }
}
