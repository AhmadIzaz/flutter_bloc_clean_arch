class Article {
  String status;
  int totalResults;
  List<ArticleElement> articles;

  Article({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

}

class ArticleElement {
  Source source;
  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  DateTime publishedAt;
  String? content;

  ArticleElement({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

}

class Source {
  String? id;
  String name;

  Source({
    required this.id,
    required this.name,
  });
}
