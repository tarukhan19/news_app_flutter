import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/features/daily_news/presentation/bloc/article/article_bloc.dart';
import 'package:news_app_flutter/features/daily_news/presentation/bloc/article/article_state.dart';
import '../../widget/loader.dart';

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
              return const Loader();
            }
            if (state is ArticlesError) {
              return Center(child: Icon(Icons.refresh));
            }
            if (state is ArticlesDone) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Text("item $index");
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
