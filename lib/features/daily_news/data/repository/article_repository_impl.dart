import 'dart:io';

import 'package:flutter_bloc_clean_arch/core/constants/constants.dart';
import 'package:flutter_bloc_clean_arch/core/resources/data_state.dart';
import 'package:flutter_bloc_clean_arch/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:flutter_bloc_clean_arch/features/daily_news/data/models/article.dart';
import 'package:flutter_bloc_clean_arch/features/daily_news/domain/repositories/article_repository.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewArticle() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
          apiKey: newsAPIKey, country: countryQuery, category: countryQuery);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
