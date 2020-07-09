import 'package:newsapp/models/newsArticle.dart';

//this class simples gives us a view model of one particular news article..

class NewsArticleViewModel {
  // what we just did here is we take a news article public field  and simply assigned it to 'newsArticle'..
  NewsArticleViewModel({NewsArticle newsArticle}) : _newsArticle = newsArticle;

  final NewsArticle _newsArticle;

  String get title => _newsArticle.title;

  String get description => _newsArticle.description;

  String get urlToImage => _newsArticle.urlToImage;

  String get url => _newsArticle.url;
}
