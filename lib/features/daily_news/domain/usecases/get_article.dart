import 'package:flutter_bloc_clean_arch/core/resources/data_state.dart';
import 'package:flutter_bloc_clean_arch/core/usecases/usecase.dart';
import 'package:flutter_bloc_clean_arch/features/daily_news/domain/entities/aritcle.dart';
import 'package:flutter_bloc_clean_arch/features/daily_news/domain/repositories/article_repository.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void param}) {
    return _articleRepository.getNewArticle();
  }
}
