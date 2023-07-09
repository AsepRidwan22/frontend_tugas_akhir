import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:frontend_tugas_akhir/data/models/model_news.dart';

import 'package:frontend_tugas_akhir/domain/usecases/get_news.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsListBloc extends Bloc<NewsEvent, NewsListState> {
  final GetNews _getNews;

  NewsListBloc(this._getNews) : super(NewsListEmpty()) {
    on<NewsEvent>((event, emit) async {
      emit(NewsListLoading());
      final result = await _getNews.execute();

      result.fold(
        (failure) {
          emit(NewsListError(failure.message));
        },
        (data) {
          emit(NewsListLoaded(data));
        },
      );
    });
  }
}
