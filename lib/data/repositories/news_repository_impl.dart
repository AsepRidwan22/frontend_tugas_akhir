import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:frontend_tugas_akhir/data/datasources/news_remote_data_source.dart';
import 'package:frontend_tugas_akhir/data/models/news.dart';
import 'package:frontend_tugas_akhir/domain/repositories/news_repository.dart';
import 'package:frontend_tugas_akhir/common/failure.dart';

import 'package:frontend_tugas_akhir/common/exception.dart';

class NewsRepositoryImpl implements NewsRepository {
  late final NewsRemoteDataSourceImpl remoteDataSource;

  NewsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ArticlesResult>> getNews() async {
    // TODO: implement getNews
    try {
      final result = await remoteDataSource.diabetesNewsId();
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
    throw UnimplementedError();
  }
}
