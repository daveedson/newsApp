import 'package:flutter/material.dart';
import 'package:newsapp/ViewModels/NewsArticleViewModel.dart';

class NewsArticleDetails extends StatelessWidget {
  final NewsArticleViewModel articleViewModel;

  const NewsArticleDetails({Key key, @required this.articleViewModel})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.articleViewModel.title,
          style: TextStyle(color: Colors.black54),
        ),
      ),
    );
  }
}
