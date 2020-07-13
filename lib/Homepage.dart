import 'package:flutter/material.dart';
import 'package:newsapp/ViewModels/NewsArticleListViewModel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel =
        Provider.of<NewsArticleListViewModel>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text('Latest news'),
      ),
      body: ListView.builder(
        itemCount: viewModel.articles.length,
        itemBuilder: (context, index) {
          final newsArticle = viewModel.articles[index];

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
      ),
    );
  }
}
