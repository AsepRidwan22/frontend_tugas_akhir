import 'package:frontend_tugas_akhir/common/state_enum.dart';
import 'package:frontend_tugas_akhir/domain/entities/user.dart';
import 'package:frontend_tugas_akhir/domain/usecases/login.dart';
import 'package:flutter/foundation.dart';
import 'package:frontend_tugas_akhir/domain/usecases/register.dart';

class UserRegisterNotifier extends ChangeNotifier {
  final RegisterUsers registerUsers;

  UserRegisterNotifier({required this.registerUsers});

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  String _message = '';
  String get message => _message;

  Future<void> register(String? email, String? name, String? password) async {
    print("masuk ke provider");
    _state = RequestState.Loading;
    notifyListeners();

    final result = await registerUsers.execute(email!, name!, password!);
    result.fold(
      (failure) {
        print("masuk ke kondisi error provider");
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (failure) {
        print("masuk ke kondisi loaded provider");
        _state = RequestState.Success;
        notifyListeners();
      },
    );
  }
}
