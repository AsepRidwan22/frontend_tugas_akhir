import 'package:frontend_tugas_akhir/domain/repositories/user_repository.dart';

class IsHaveProfile {
  final UserRepository repository;

  IsHaveProfile(this.repository);

  Future<bool> execute(String email) async {
    return repository.isHaveProfile(email);
  }
}
