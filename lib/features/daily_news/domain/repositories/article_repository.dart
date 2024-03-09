import 'package:flutter_bloc_clean_arch/core/resources/data_state.dart';
import 'package:flutter_bloc_clean_arch/features/daily_news/domain/entities/aritcle.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewArticle();
}
