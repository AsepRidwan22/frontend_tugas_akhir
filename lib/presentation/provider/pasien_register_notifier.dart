import 'package:frontend_tugas_akhir/common/state_enum.dart';
// import 'package:frontend_tugas_akhir/domain/entities/user.dart';
// import 'package:frontend_tugas_akhir/domain/usecases/login_user.dart';
import 'package:flutter/foundation.dart';
import 'package:frontend_tugas_akhir/domain/usecases/register.dart';

class UserRegisterNotifier extends ChangeNotifier {
  final RegisterUsers registerUsers;

  UserRegisterNotifier({required this.registerUsers});

  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  String _message = '';
  String get message => _message;

  Future<void> register(String? email, String? name, String? password) async {
    // print("masuk ke provider");
    _state = RequestState.loading;
    notifyListeners();

    final result = await registerUsers.execute(email!, name!, password!);
    result.fold(
      (failure) {
        // print("masuk ke kondisi error provider");
        _message = failure.message;
        _state = RequestState.error;
        notifyListeners();
      },
      (failure) {
        // print("masuk ke kondisi loaded provider");
        _state = RequestState.success;
        notifyListeners();
      },
    );
  }
}
