import 'package:flutter/material.dart';

import 'ViewModels/NewsArticleViewModel.dart';

class NewsList extends StatelessWidget {
  final List<NewsArticleViewModel> articles;

  const NewsList({Key key, @required this.articles}) : super(key: key);
  @override
  Widget build(BuildContext context) {
//    final viewModel =
//        Provider.of<NewsArticleListViewModel>(context, listen: true);
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final newsArticle = articles[index];

        return ListTile(
          leading: Container(
            width: 100,
            height: 100,
            child: newsArticle.urlToImage == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Image.network(newsArticle.urlToImage),
          ),
          title: Text(newsArticle.title),
        );
      },
    );
  }
}
