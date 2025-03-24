import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/features/daily_news/presentation/bloc/article/article_bloc.dart';
import 'package:news_app_flutter/features/daily_news/presentation/bloc/article/article_event.dart';
import 'package:news_app_flutter/features/daily_news/presentation/screen/home/daily_news.dart';
import 'package:news_app_flutter/injection_container.dart';

import 'config/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();
  runApp(BlocProvider(create: (_) => sl<ArticleBloc>(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArticleBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkThemeMode,
        title: 'Daily News',
        home: DailyNews(),
      ),
    );
  }
}
