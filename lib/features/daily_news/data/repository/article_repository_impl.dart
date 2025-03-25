import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app_flutter/core/resources/data_state.dart';
import 'package:news_app_flutter/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:news_app_flutter/features/daily_news/data/models/article.dart';
import 'package:news_app_flutter/features/daily_news/domain/repository/article_repository.dart';

import '../../../../core/constant/constants.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticle() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticle(
        apikey: apiKeyQuery,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final data =httpResponse.response.data;
        final articlesList = data['articles'] as List<dynamic>;
        final articles = ArticleModel.fromJsonList(articlesList);

        return DataSuccess(articles);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
