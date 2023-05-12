import 'dart:convert';

import 'package:frontend_tugas_akhir/common/config.dart';
import 'package:http/http.dart' as http;

import 'package:frontend_tugas_akhir/common/exception.dart';
import 'package:frontend_tugas_akhir/data/models/news.dart';

class NewsRemoteDataSourceImpl {
  final apiKey = Config().newsKey;
  static const baseUrl = 'https://newsapi.org/v2';
  static const query = 'kesehatan';
  static const sort = 'publishedAt';
  static const language = 'id';

  Future<ArticlesResult> diabetesNewsId() async {
    final response = await http.get(Uri.parse(
        "$baseUrl/everything?language=$language&q=$query&sortBy=$sort&apiKey=$apiKey"));
    if (response.statusCode == 200) {
      return ArticlesResult.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  Future<ArticlesResult> diabetesNewsEn() async {
    final response = await http.get(Uri.parse(
        "$baseUrl/everything?language=$language&q=$query&sortBy=$sort&apiKey=$apiKey"));
    if (response.statusCode == 200) {
      return ArticlesResult.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
