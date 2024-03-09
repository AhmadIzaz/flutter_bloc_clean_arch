import 'package:flutter_bloc_clean_arch/core/resources/data_state.dart';
import 'package:flutter_bloc_clean_arch/features/daily_news/domain/usecases/get_article.dart';
import 'package:flutter_bloc_clean_arch/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:flutter_bloc_clean_arch/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticleBloc(this._getArticleUseCase)
      : super(const RemoteArticleLoading()) {
    on<GetArticle>(getArticles);
  }

  void getArticles(
      GetArticle event, Emitter<RemoteArticleState> emitter) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticleSuccess(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RemoteArticleFailure(dataState.error!));
    }
  }
}
