import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:frontend_tugas_akhir/data/datasources/news_remote_data_source.dart';
import 'package:frontend_tugas_akhir/data/models/model_news.dart';
import 'package:frontend_tugas_akhir/domain/repositories/news_repository.dart';
import 'package:frontend_tugas_akhir/common/failure.dart';

import 'package:frontend_tugas_akhir/common/exception.dart';

class NewsRepositoryImpl implements NewsRepository {
  late final NewsRemoteDataSourceImpl remoteDataSource;

  NewsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ArticlesResult>> getNews() async {
    try {
      final result = await remoteDataSource.diabetesNewsId();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
