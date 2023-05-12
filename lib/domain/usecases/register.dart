import 'package:dartz/dartz.dart';
import 'package:dartz/dartz.dart';
import 'package:frontend_tugas_akhir/common/failure.dart';
import 'package:frontend_tugas_akhir/domain/entities/user.dart';
import 'package:frontend_tugas_akhir/domain/repositories/user_repository.dart';

class RegisterUsers {
  final UserRepository repository;

  RegisterUsers(this.repository);

  Future<Either<Failure, String>> execute(
      String email, String name, String password) async {
    print("masuk ke usecase");
    return repository.registerUsers(email, name, password);
  }
}
