import 'package:news_app_flutter/core/constant/constants.dart';
import 'package:news_app_flutter/features/daily_news/data/models/article.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: newsApiBaseUrl)
abstract class NewsApiService {
  factory NewsApiService (Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticle({
    @Query('apikey') String ? apikey,
    @Query('country') String ? country,
    @Query('category') String ? category,
  });

}