import 'article.dart';

class NewsResponseModel {
  final List<ArticleModel> articles;

  NewsResponseModel({
    required this.articles,
  });

  factory NewsResponseModel.fromJson(Map<String, dynamic> json) {
    return NewsResponseModel(
      articles: (json["articles"] as List)
          .map((article) => ArticleModel.fromJson(article))
          .toList(),
    );
  }
}
