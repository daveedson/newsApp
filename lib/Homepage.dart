import 'package:flutter/material.dart';
import 'package:newsapp/NewsList.dart';
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

  final _controller = TextEditingController();

  //this method checks for different Ui states using an enum in the NewsArticleListViewModelClass.
  Widget _buildItems(NewsArticleListViewModel viewModel) {
    switch (viewModel.loadingStatus) {
      case LoadingStatus.searching:
        return Center(
          child: CircularProgressIndicator(),
        );

      case LoadingStatus.empty:
        return Expanded(
          child: Container(
            height: 400,
            width: 300,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset('images/cherry.png'),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'No Results Found',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ),
        );
      case LoadingStatus.completed:
        return Expanded(
          child: NewsList(articles: viewModel.articles),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel =
        Provider.of<NewsArticleListViewModel>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          title: Text('Latest news'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                onSubmitted: _searchLatestNews,
                controller: _controller,
                decoration: InputDecoration(
                    hintText: 'Search',
                    icon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () => _controller.clear(),
                    )),
              ),
            ),
            _buildItems(viewModel),
          ],
        ));
  }

  void _searchLatestNews(String keyword) {
    final viewModel =
        Provider.of<NewsArticleListViewModel>(context, listen: false);
    if (keyword.isNotEmpty) {
      viewModel.searchLatestNews(keyword);
    }
  }
}
