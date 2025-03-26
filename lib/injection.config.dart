// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:news_app_flutter/features/daily_news/data/data_source/remote/news_api_service.dart'
    as _i62;
import 'package:news_app_flutter/features/daily_news/data/repository/article_repository_impl.dart'
    as _i445;
import 'package:news_app_flutter/features/daily_news/domain/repository/article_repository.dart'
    as _i370;
import 'package:news_app_flutter/features/daily_news/domain/usecase/get_article.dart'
    as _i881;
import 'package:news_app_flutter/features/daily_news/presentation/bloc/article/article_bloc.dart'
    as _i961;
import 'package:news_app_flutter/injection.dart' as _i772;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i62.NewsApiService>(
      () => _i62.NewsApiService(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i370.ArticleRepository>(
      () => _i445.ArticleRepositoryImpl(gh<_i62.NewsApiService>()),
    );
    gh.lazySingleton<_i881.GetArticleUseCase>(
      () => _i881.GetArticleUseCase(gh<_i370.ArticleRepository>()),
    );
    gh.factory<_i961.ArticleBloc>(
      () => _i961.ArticleBloc(gh<_i881.GetArticleUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i772.RegisterModule {}
