
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/articles.dart';

abstract class ArticleState extends Equatable {
  final List<ArticleEntity>? article;
  final DioException? error;

  const ArticleState({this.article, this.error});

  @override
  List<Object?> get props => [article!, error!];
}

class ArticlesLoading extends ArticleState {
  const ArticlesLoading();
}

class ArticlesDone extends ArticleState {
  const ArticlesDone(List<ArticleEntity> articles) : super(article: articles);
}

class ArticlesError extends ArticleState {
  const ArticlesError(DioException errors) : super(error: errors);
}
