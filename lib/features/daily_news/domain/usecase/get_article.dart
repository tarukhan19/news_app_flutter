import 'package:news_app_flutter/core/resources/data_state.dart';
import 'package:news_app_flutter/core/usecase/usecase.dart';
import 'package:news_app_flutter/features/daily_news/domain/entities/articles.dart';
import 'package:news_app_flutter/features/daily_news/domain/repository/article_repository.dart';

/*
use case is where business logic is executed.
all use case is do —> getting data from repository
 */
class GetArticleUseCase extends Usecase<DataState<List<ArticleEntity>>,void>{
  final ArticleRepository _articleRepository;
  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void param}) {
    return _articleRepository.getNewsArticle();
  }

}