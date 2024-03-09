import '../../domain/entities/aritcle.dart';
import 'package:floor/floor.dart';
import 'dart:convert';


class ArticleModel extends ArticleEntity {
  const ArticleModel({
    super.source,
    super.author,
    super.title,
    super.description,
    super.url,
    super.urlToImage,
    super.publishedAt,
    super.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      source: SourceModel.fromJson(map['source']),
      author: map['author'] ?? "",
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      url: map['url'] ?? "",
      urlToImage: map['urlToImage'] ?? "",
      publishedAt: map['publishedAt'] ?? "",
      content: map['content'] ?? "",
    );
  }
}

class SourceModel extends SourceEntity {
  const SourceModel({required super.id, required super.name});

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}



class SourceTypeConverter extends TypeConverter<SourceModel, String> {
  @override
  SourceModel decode(String databaseValue) {
    final json = jsonDecode(databaseValue);
    return SourceModel.fromJson(json as Map<String, dynamic>);
  }

  @override
  String encode(SourceModel value) {
    final json = value.toJson();
    return jsonEncode(json);
  }
}
