import 'package:frontend_tugas_akhir/common/state_enum.dart';
// import 'package:frontend_tugas_akhir/domain/entities/user.dart';
import 'package:frontend_tugas_akhir/domain/usecases/login.dart';
import 'package:flutter/foundation.dart';

class DokterLoginNotifier extends ChangeNotifier {
  final LoginDokters loginDokters;
  // final String role;

  DokterLoginNotifier({required this.loginDokters});

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  String _message = '';
  String get message => _message;

  Future<void> login(String? email, String? password) async {
    print("masuk ke provider");
    _state = RequestState.Loading;
    notifyListeners();

    final result = await loginDokters.execute(email!, password!);
    result.fold((failure) {
      print("masuk ke kondisi loading provider");
      _message = failure.message;
      _state = RequestState.Error;
      notifyListeners();
    }, (failure) {
      print("masuk ke kondisi loaded provider");
      _state = RequestState.Success;
      notifyListeners();
    });
  }
}
