import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/features/daily_news/presentation/bloc/article/article_bloc.dart';
import 'package:news_app_flutter/features/daily_news/presentation/screen/home/daily_news.dart';
import 'config/theme/theme.dart';
import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

 await configureDependencies();
  runApp(BlocProvider(
      create: (_) => sl<ArticleBloc>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkThemeMode,
        title: 'Daily News',
        home: DailyNews(),
      )));
}
