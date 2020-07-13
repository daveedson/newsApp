class Url {
  static String urlFetchTopHeadlines =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=d788a3f56d6648c594f5c776480a57ec';
  static String urlSearchTopHeadlines(String keyword) {
    return 'https://newsapi.org/v2/everything?q=$keyword&apiKey=d788a3f56d6648c594f5c776480a57ec';
  }
}
