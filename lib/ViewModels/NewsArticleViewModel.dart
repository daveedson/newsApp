import 'package:newsapp/models/newsArticle.dart';

class NewsArticleViewModel {
  NewsArticleViewModel({NewsArticle newsArticle}) : _newsArticle = newsArticle;
  final NewsArticle _newsArticle;

  String get title {
    return _newsArticle.title;
  }

  String get description {
    return _newsArticle.description;
  }

  String get urlToImage {
    return _newsArticle.urlToImage;
  }

  String get url {
    return _newsArticle.url;
  }
}
