import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_arch/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:flutter_bloc_clean_arch/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Daily News",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
        builder: (context, state) {
      if (state is RemoteArticleLoading) {
        return const Center(child: CupertinoActivityIndicator());
      }

      if (state is RemoteArticleSuccess) {
        return ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Text("${state.article?[index].title}"),
                    SizedBox(height: 20),
                    Text("${state.article?[index].content}"),
                    Divider(height: 10, thickness: 5)
                  ],
                ),
              );
            },
            itemCount: state.article!.length);
      }

      if (state is RemoteArticleFailure) {
        return const Center(child: Icon(Icons.refresh));
      }

      return const SizedBox();
    });
  }
}
