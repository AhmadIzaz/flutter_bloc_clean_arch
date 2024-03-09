import 'dart:convert';

import 'package:flutter_bloc_clean_arch/core/constants/constants.dart';
import 'package:flutter_bloc_clean_arch/features/daily_news/data/models/article.dart';
import 'package:flutter_bloc_clean_arch/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
