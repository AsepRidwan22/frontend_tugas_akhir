import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:frontend_tugas_akhir/data/datasources/user_remote_data_source.dart';
import 'package:frontend_tugas_akhir/domain/entities/user.dart';
import 'package:frontend_tugas_akhir/domain/repositories/user_repository.dart';
import 'package:frontend_tugas_akhir/common/failure.dart';
import 'package:frontend_tugas_akhir/common/exception.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, String>> loginUsers(
      String email, String password) async {
    try {
      final result = await remoteDataSource.loginUsers(email, password);
      return Right(result);
    } on SocketException {
      return const Left(ConnectionFailure('Gagal Menghubungkan ke Jaringan'));
    } catch (e) {
      //bagian ini saya rasa kurang tepat, karena tidak ada penanganan error yang spesifik
      final errorMessage = e.toString().replaceAll('Exception:', '').trim();
      return Left(ServerFailure(errorMessage));
    }
  }

  @override
  Future<Either<Failure, String>> loginDokters(
      String email, String password) async {
    try {
      final result = await remoteDataSource.loginDokters(email, password);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('Filed to connect to the server'));
    } on SocketException {
      return const Left(ConnectionFailure('Gagal Menghubungkan ke Jaringan'));
    }
  }

  @override
  Future<Either<Failure, User>> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> registerUsers(
      String email, String name, String password) async {
    try {
      final result =
          await remoteDataSource.registerUsers(email, name, password);
      return Right(result);
    } on ServerException {
      // print('server exception error');
      return const Left(ServerFailure('Filed to connect to the server'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } catch (e) {
      //bagian ini saya rasa kurang tepat, karena tidak ada penanganan error yang spesifik
      final errorMessage = e.toString().replaceAll('Exception:', '').trim();
      return Left(ServerFailure(errorMessage));
      // Kode lain untuk menangani kesalahan yang tidak terduga
    }
  }

  @override
  Future<bool> getRememberMe() {
    // TODO: implement getRememberMe
    throw UnimplementedError();
  }

  @override
  Future<bool> setRememberMe(bool value) {
    // TODO: implement setRememberMe
    throw UnimplementedError();
  }

  @override
  Future<bool> isDokter(bool value) {
    // TODO: implement isDokter
    throw UnimplementedError();
  }

  @override
  Future<bool> isHaveProfile(String email) {
    // TODO: implement isHaveProfile
    throw UnimplementedError();
  }

  @override
  Future<bool> isLogIn() {
    // TODO: implement isLogIn
    throw UnimplementedError();
  }

  @override
  Future<bool> saveIsLogIn(bool value) {
    // TODO: implement saveIsLogIn
    throw UnimplementedError();
  }
}
