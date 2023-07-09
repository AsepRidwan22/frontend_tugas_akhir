import 'package:dartz/dartz.dart';
import 'package:frontend_tugas_akhir/data/models/model_news.dart';
import 'package:frontend_tugas_akhir/common/failure.dart';

abstract class NewsRepository {
  Future<Either<Failure, ArticlesResult>> getNews();
}
