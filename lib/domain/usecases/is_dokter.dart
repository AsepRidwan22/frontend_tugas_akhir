import 'package:frontend_tugas_akhir/domain/repositories/user_repository.dart';

class IsDokter {
  final UserRepository repository;

  IsDokter(this.repository);

  Future<bool> execute(bool value) async {
    return repository.isDokter(value);
  }
}
