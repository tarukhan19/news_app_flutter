import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app_flutter/features/daily_news/domain/entities/articles.dart';

class NewsItem extends StatelessWidget {
  final ArticleEntity? articleEntity;

  const NewsItem({super.key, this.articleEntity});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage:
                  articleEntity?.urlToImage != null
                      ? CachedNetworkImageProvider(articleEntity!.urlToImage!)
                      : null,
              radius: 24,
            ),
            SizedBox(width: 10),
            Text(
              'by ${articleEntity?.author ?? "Unknown"}',
              style: TextStyle(color: Colors.white),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
