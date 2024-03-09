import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_arch/config/theme/app_theme.dart';
import 'package:flutter_bloc_clean_arch/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:flutter_bloc_clean_arch/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:flutter_bloc_clean_arch/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:flutter_bloc_clean_arch/injection_container.dart';

void main() async {
  await initializeInstances();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (BuildContext context) => sl()..add(const GetArticle()),
      child: MaterialApp(
          title: 'Flutter Demo', theme: theme(), home: const DailyNews()),
    );
  }
}
