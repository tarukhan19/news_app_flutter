import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app_flutter/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:news_app_flutter/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:news_app_flutter/features/daily_news/domain/repository/article_repository.dart';
import 'package:news_app_flutter/features/daily_news/domain/usecase/get_article.dart';
import 'package:news_app_flutter/features/daily_news/presentation/bloc/article/article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl
    ..registerSingleton<Dio>(Dio())
    ..registerSingleton<NewsApiService>(NewsApiService(sl()))
    ..registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()))
    ..registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()))
    ..registerFactory<ArticleBloc>(() => ArticleBloc(sl()));
}
