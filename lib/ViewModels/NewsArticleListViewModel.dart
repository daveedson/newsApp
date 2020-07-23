import 'package:flutter/foundation.dart';
import 'package:newsapp/ViewModels/NewsArticleViewModel.dart';
import 'package:newsapp/models/newsArticle.dart';
import 'package:newsapp/services/Webservices.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class NewsArticleListViewModel extends ChangeNotifier {
  var loadingStatus = LoadingStatus.searching;

  //Instance creation of NewsArticleViewModel
  // also created a list of NewsArticleViewModel
  List<NewsArticleViewModel> articles = new List<NewsArticleViewModel>();

  //this function is responsible for populating the top headlines..
  Future<void> populateHeadlines() async {
    this.loadingStatus = LoadingStatus.searching;

    List<NewsArticle> newsArticles = await WebService().fetchTopHeadlines();

    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(newsArticle: article))
        .toList();
    this.loadingStatus =
        this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }

  //this method enables search of different news with there key words..
  Future<void> searchLatestNews(String keyword) async {
    this.loadingStatus = LoadingStatus.searching;
    List<NewsArticle> searchNews = await WebService().searchHeadlines(keyword);
    this.articles = searchNews
        .map((newsArticles) => NewsArticleViewModel(newsArticle: newsArticles))
        .toList();
    this.loadingStatus =
        this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }
}
