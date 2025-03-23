import 'package:equatable/equatable.dart';

/*
-----first step------

Entities are business object of an application.
type of data api has, will define here.
 */
class ArticleEntity extends Equatable {
  final int? id;
  final String? auther;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const ArticleEntity(
  {
    this.id,
    this.auther,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  }
  );

  @override
  List<Object?> get props => throw UnimplementedError();
}
