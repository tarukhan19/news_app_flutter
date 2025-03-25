import 'article.dart';

class NewsResponseModel {
  final List<ArticleModel> articles;

  NewsResponseModel({
    required this.articles,
  });

  factory NewsResponseModel.fromJson(Map<String, dynamic> json) {
    return NewsResponseModel(
      articles: (json["articles"] as List) // 1️⃣ Extracts "articles" as a List
          .map((article) => ArticleModel.fromJson(article)) // 2️⃣ Converts each JSON article into an `ArticleModel` object
          .toList(), // 3️⃣ Converts the mapped results back into a List
    );
  }
}
