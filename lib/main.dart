import 'package:flutter/material.dart';
import 'package:newsapp/ViewModels/NewsArticleListViewModel.dart';
import 'package:provider/provider.dart';

import 'Homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.teal[300], scaffoldBackgroundColor: Colors.grey),
      home: ChangeNotifierProvider(
        create: (context) => NewsArticleListViewModel(),
        child: HomePage(),
      ),
    );
  }
}
