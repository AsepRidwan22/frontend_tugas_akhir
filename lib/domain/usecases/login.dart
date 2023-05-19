import 'package:dartz/dartz.dart';
// import 'package:dartz/dartz.dart';
import 'package:frontend_tugas_akhir/common/failure.dart';
// import 'package:frontend_tugas_akhir/domain/entities/user.dart';
import 'package:frontend_tugas_akhir/domain/repositories/user_repository.dart';

class LoginUsers {
  final UserRepository repository;

  LoginUsers(this.repository);

  Future<Either<Failure, String>> execute(String email, String password) async {
    print("masuk ke usecase");
    return repository.loginUsers(email, password);
  }
}

class LoginDokters {
  final UserRepository repository;

  LoginDokters(this.repository);

  Future<Either<Failure, String>> execute(String email, String password) async {
    print("masuk ke usecase");
    return repository.loginDokters(email, password);
  }
}
