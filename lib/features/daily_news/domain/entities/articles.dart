import 'package:equatable/equatable.dart';

/*
-----first step------

Entities are business object of an application.
type of data api has, will define here.

If we don't use Equatable, we must manually override == and hashCode:
Dart will compare objects based on their values, not memory references.
 */
class ArticleEntity extends Equatable {
  final int? id;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  /*
📌 Named parameter ({}) : allow to specify arguments explicitly by name.
                     parameters are optional by default.
                     By default, named parameters are optional.
                     we can make them required using the required keyword.

📌 Positional parameters () : It is passed in order, just like traditional function parameters.
                          we can use square brackets [] to make parameters optional
   */
  const ArticleEntity({
    this.id,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  @override
  List<Object?> get props => [
    id,
    author, // Fixed typo
    title,
    description,
    url,
    urlToImage,
    publishedAt,
    content,
  ];
}
