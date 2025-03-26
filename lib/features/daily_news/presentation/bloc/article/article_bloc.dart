import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app_flutter/core/resources/data_state.dart';
import 'package:news_app_flutter/features/daily_news/domain/usecase/get_article.dart';

import 'article_event.dart';
import 'article_state.dart';

@injectable
class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  ArticleBloc(this._getArticleUseCase) : super(const ArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(GetArticles event, Emitter<ArticleState> emit) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(ArticlesDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(ArticlesError(dataState.error!));
    }
  }
}
