import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:frontend_tugas_akhir/data/datasources/user_remote_data_source.dart';
import 'package:frontend_tugas_akhir/data/models/model_user.dart';
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
      return Right("$result");
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
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
    } on ServerException catch (e) {
      return Left(ServerFailure(''));
    } on SocketException catch (e) {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
