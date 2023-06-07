import 'package:frontend_tugas_akhir/domain/repositories/user_repository.dart';

class GetRememberMe {
  final UserRepository repository;

  GetRememberMe(this.repository);

  Future<bool> execute() async {
    return repository.getRememberMe();
  }
}
