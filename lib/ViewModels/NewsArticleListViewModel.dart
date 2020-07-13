import 'package:flutter/foundation.dart';
import 'package:newsapp/ViewModels/NewsArticleViewModel.dart';
import 'package:newsapp/models/newsArticle.dart';
import 'package:newsapp/services/Webservices.dart';

class NewsArticleListViewModel extends ChangeNotifier {
  //Instance creation of NewsArticleViewModel
  // also created a list of NewsArticleViewModel
  List<NewsArticleViewModel> articles = new List<NewsArticleViewModel>();

//  NewsArticleListViewModel() {
//    _populateHeadlines();
//  }

  //this function is responsible for populating the top headlines..
  Future<void> populateHeadlines() async {
    List<NewsArticle> newsArticles = await WebService().fetchTopHeadlines();

    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(newsArticle: article))
        .toList();
    notifyListeners();
  }

  //this method enables search of different news with there key words..
  Future<void> searchLatestNews(String keyword) async {
    List<NewsArticle> searchNews = await WebService().searchHeadlines(keyword);
    this.articles = searchNews
        .map((newsArticles) => NewsArticleViewModel(newsArticle: newsArticles))
        .toList();
    notifyListeners();
  }
}
