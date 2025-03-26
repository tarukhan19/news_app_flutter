import 'package:injectable/injectable.dart';
import 'package:news_app_flutter/core/constant/constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/new_response.dart';

part 'news_api_service.g.dart';

@lazySingleton
@RestApi(baseUrl: newsApiBaseUrl)
abstract class NewsApiService {
  @factoryMethod
  factory NewsApiService (Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<NewsResponseModel>> getNewsArticle({
    @Query('apikey') String ? apikey,
    @Query('country') String ? country,
    @Query('category') String ? category,
  });

}