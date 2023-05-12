// import 'package:flutter/foundation.dart';
// // import 'package:your_app/core/errors/failures.dart';
// import 'package:frontend_tugas_akhir/common/failure.dart';
// import 'package:frontend_tugas_akhir/data/models/news.dart';

// // import 'package:your_app/core/usecases/usecase.dart';
// import 'package:frontend_tugas_akhir/domain/usecases/get_news.dart';

// // import 'package:your_app/features/news/domain/entities/news_article.dart';
// import 'package:frontend_tugas_akhir/domain/usecases/get_news.dart';

// // import 'package:your_app/features/news/domain/usecases/get_top_headlines.dart';
// // import 'package:frontend_tugas_akhir/domain/usecases/get_news.dart';

// import 'package:frontend_tugas_akhir/common/state_enum.dart';

// class NewsNotifier extends ChangeNotifier {
//   final GetNews getNews;

//   NewsNotifier({
//     required this.getNews,
//   });

//   // List<ArticlesResult>? _articles;
//   var _articles = <ArticlesResult>[];

//   List<ArticlesResult>? get articles => _articles;

//   RequestState _state = RequestState.Empty;
//   RequestState get state => _state;

//   String _message = '';
//   String get message => _message;

//   // Future<void> getnews() async {
//   //   final result = await getNews.execute();

//   //   // result.fold(
//   //   //   (failure) => print('Failed to get top headlines: ${failure.message}'),
//   //   //   (articles) {
//   //   //     _articles = articles;
//   //   //     notifyListeners();
//   //   //   },
//   //   // );

//   //   result.fold(
//   //     (failure) {
//   //       print("masuk ke kondisi error provider");
//   //       _message = failure.message;
//   //       _state = RequestState.Error;
//   //       notifyListeners();
//   //     },
//   //     // (failure) {
//   //     //   print("masuk ke kondisi error provider");
//   //     //   // _message = failure.message;
//   //     //   _state = RequestState.Loading;
//   //     //   notifyListeners();
//   //     // },
//   //     (data) {
//   //       print("masuk ke kondisi loaded provider");
//   //       _state = RequestState.Loaded;
//   //       notifyListeners();
//   //     },
//   //   );

//   Future<void> getnews() async {
//     _state = RequestState.Loading;
//     notifyListeners();

//     final result = await getNews.execute();
//     result.fold(
//       (failure) {
//         _state = RequestState.Error;
//         _message = failure.message;
//         notifyListeners();
//       },
//       (moviesData) {
//         _state = RequestState.Loaded;
//         _articles = moviesData;
//         notifyListeners();
//       },
//     );
//   }
// }
