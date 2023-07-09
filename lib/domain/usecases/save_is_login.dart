import 'package:frontend_tugas_akhir/domain/repositories/user_repository.dart';

class SaveIsLogIn {
  final UserRepository repository;

  SaveIsLogIn(this.repository);

  Future<bool> execute(bool value) async {
    return repository.saveIsLogIn(value);
  }
}
