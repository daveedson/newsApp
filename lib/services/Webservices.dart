import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/URLS/urls.dart';
import 'package:newsapp/models/newsArticle.dart';

class WebService {
  //this method simply searches for the any news in the api..
  Future<List<NewsArticle>> searchHeadlines(String keyword) async {
    final String url = Url.urlSearchTopHeadlines(keyword);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['articles'];
      list.map((articles) => NewsArticle.fromJSON(articles)).toList();
    }
    throw Exception('Failed to search');
  }

  //this method fetches the latest news from news api website.
  Future<List<NewsArticle>> fetchTopHeadlines() async {
    try {
      final String url = Url.urlFetchTopHeadlines;
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        //we make this Iterable because we want to loop through the array of values in article value.
        Iterable list = result['articles'];
        return list.map((article) => NewsArticle.fromJSON(article)).toList();
      } else {
        throw Exception("failed to get latest news");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
