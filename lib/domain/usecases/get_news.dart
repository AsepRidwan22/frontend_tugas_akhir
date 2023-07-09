import 'package:dartz/dartz.dart';
import 'package:frontend_tugas_akhir/data/models/model_news.dart';
import 'package:frontend_tugas_akhir/common/failure.dart';
import '../repositories/news_repository.dart';

class GetNews {
  final NewsRepository repository;

  GetNews(this.repository);

  Future<Either<Failure, ArticlesResult>> execute() {
    return repository.getNews();
  }
}
