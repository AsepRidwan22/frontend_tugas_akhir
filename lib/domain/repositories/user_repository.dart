import 'package:dartz/dartz.dart';
import 'package:frontend_tugas_akhir/common/failure.dart';
import '../entities/user.dart';
// import '../entities/kesehatan.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getUser();
  Future<Either<Failure, String>> loginUsers(String email, String password);
  Future<Either<Failure, String>> loginDokters(String email, String password);
  Future<Either<Failure, String>> registerUsers(
      String email, String name, String password);
  Future<bool> setRememberMe(bool value);
  Future<bool> isLogIn();
  Future<bool> saveIsLogIn(bool value);
  Future<bool> isDokter(bool value);
  Future<bool> isHaveProfile(String email);
  Future<bool> getRememberMe();
}
