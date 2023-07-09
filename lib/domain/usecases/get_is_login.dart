import 'package:frontend_tugas_akhir/domain/repositories/user_repository.dart';

class GetIsLogIn {
  final UserRepository repository;

  GetIsLogIn(this.repository);

  Future<bool> execute() async {
    return repository.isLogIn();
  }
}
