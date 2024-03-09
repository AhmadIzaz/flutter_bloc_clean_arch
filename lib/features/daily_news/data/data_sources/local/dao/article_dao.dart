import 'package:floor/floor.dart';
import 'package:flutter_bloc_clean_arch/features/daily_news/data/models/article.dart';

@dao
abstract class ArticleDao {
  @Insert()
  Future<void> insertArticle(ArticleModel articleModel);

  @delete
  Future<void> deleteArticle(ArticleModel articleModel);

  @Query('Select * FROM article')
  Future<List<ArticleModel>> getArticles();
}
