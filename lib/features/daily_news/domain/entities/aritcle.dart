import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:flutter_bloc_clean_arch/features/daily_news/data/models/article.dart';

class ArticleEntity extends Equatable {
  final SourceEntity? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const ArticleEntity({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  @override
  List<Object?> get props {
    return [
      source,
      author,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content,
    ];
  }
}

class SourceEntity extends Equatable {
  final String? id;
  final String name;

  const SourceEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}
