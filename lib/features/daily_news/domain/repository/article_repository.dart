/*
-----second step------

* bridge between data layer and domain layer

* repository in domain layer is abstract class in which there are functions which still
needs to be implemented

* actual implementation of repository will be in data layer, Data is responsible for coordinating
data from different data sources
 */
import 'package:news_app_flutter/core/resources/data_state.dart';
import 'package:news_app_flutter/features/daily_news/domain/entities/articles.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticle();
}
