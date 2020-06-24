import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/models/newsArticle.dart';

class WebService {
  //this method fetches the latest news from news api website.
  Future<List<NewsArticle>> fetchLatestHeadlines() async {
    try {
      String url =
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=d788a3f56d6648c594f5c776480a57ec';
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
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
