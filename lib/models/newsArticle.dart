class NewsArticle {
  final String title;
  final String description;
  final String urlToImage;
  final String url;

  NewsArticle({this.title, this.description, this.urlToImage, this.url});

  //this methods returns the json form NewsApi website
  factory NewsArticle.fromJSON(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      description: json['description'],
    );
  }
}
