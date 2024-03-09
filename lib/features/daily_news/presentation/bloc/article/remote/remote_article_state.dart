import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc_clean_arch/features/daily_news/domain/entities/aritcle.dart';
import 'package:dio/dio.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? article;
  final DioException? error;

  const RemoteArticleState({this.article, this.error});

  @override
  // TODO: implement props
  List<Object?> get props => [article, error];
}

class RemoteArticleLoading extends RemoteArticleState {
  const RemoteArticleLoading();
}

class RemoteArticleSuccess extends RemoteArticleState {
  const RemoteArticleSuccess(List<ArticleEntity> articles)
      : super(article: articles);
}

class RemoteArticleFailure extends RemoteArticleState {
  const RemoteArticleFailure(DioException error) : super(error: error);
}
