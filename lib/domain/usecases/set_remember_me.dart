import 'package:frontend_tugas_akhir/domain/repositories/user_repository.dart';

class SetRememberMe {
  final UserRepository repository;

  SetRememberMe(this.repository);

  Future<bool> execute(bool value) async {
    return repository.setRememberMe(value);
  }
}
