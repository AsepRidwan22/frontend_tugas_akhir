import 'package:frontend_tugas_akhir/common/state_enum.dart';
import 'package:frontend_tugas_akhir/domain/usecases/login_user.dart';
import 'package:flutter/foundation.dart';

class PasienLoginNotifier extends ChangeNotifier {
  final LoginUsers loginUsers;

  PasienLoginNotifier({required this.loginUsers});

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
    try {
      _state = RequestState.loading;
      notifyListeners();

      final result = await loginUsers.execute(email!, password!);
      result.fold((failure) {
        _message = failure.message;
        _state = RequestState.error;
        notifyListeners();
      }, (user) {
        _state = RequestState.success;
        notifyListeners();
      });
    } catch (e) {
      _message = 'An error occurred';
      _state = RequestState.error;
      notifyListeners();
    }
  }
}
