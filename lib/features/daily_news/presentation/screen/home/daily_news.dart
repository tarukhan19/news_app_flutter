import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/features/daily_news/presentation/bloc/article/article_bloc.dart';
import 'package:news_app_flutter/features/daily_news/presentation/bloc/article/article_state.dart';
import '../../bloc/article/article_event.dart';
import '../../widget/loader.dart';
import '../../widget/news_item.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocBuilder<ArticleBloc, ArticleState>(
          builder: (context, state) {
            if (state is ArticlesLoading) {
              context.read<ArticleBloc>().add(const GetArticles());
              return const Loader();
            }
            if (state is ArticlesError) {
              return Center(child: Icon(Icons.refresh));
            }
            if (state is ArticlesDone) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  if (state.article == null) {
                    return SizedBox();
                  }
                  // print("articles >>>>>>>>>>>  ${state.article![1]}");
                  return NewsItem(articleEntity: state.article![index],);
                },
                itemCount: state.article!.length,
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
