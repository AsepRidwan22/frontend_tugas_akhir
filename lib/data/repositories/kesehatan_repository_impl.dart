import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:frontend_tugas_akhir/data/datasources/kesehatan_remote_data_source.dart';
// import 'package:frontend_tugas_akhir/data/datasources/news_remote_data_source.dart';
// import 'package:frontend_tugas_akhir/data/datasources/user_remote_data_source.dart';
// import 'package:frontend_tugas_akhir/data/models/model_news.dart';
import 'package:frontend_tugas_akhir/domain/entities/kesehatan.dart';
import 'package:frontend_tugas_akhir/domain/repositories/kesehatan_repository.dart';
// import 'package:frontend_tugas_akhir/domain/repositories/news_repository.dart';
import 'package:frontend_tugas_akhir/common/failure.dart';

import 'package:frontend_tugas_akhir/common/exception.dart';

class KesehatanRepositoryImpl implements KesehatanRepository {
  final KesehatanRemoteDataSource remoteDataSource;

  KesehatanRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Kesehatan>> getKesehatan() async {
    try {
      final result = await remoteDataSource.kesehatan();
      final kesehatan = result.toEntity();
      return Right(kesehatan);
    } on ServerException {
      return const Left(ServerFailure('Filed to connect to the server'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
