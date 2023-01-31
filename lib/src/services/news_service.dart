import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:http/http.dart' as http;

const _urlNews = 'https://newsapi.org/v2';
const _apiKey = '4af5ccd83b9841b79ae063eb12116fe4';

class NewsService with ChangeNotifier {
  List<Article> headLines = [];

  NewsService() {
    getTopHeadlines();
  }

  getTopHeadlines() async {
    const url = '$_urlNews/top-headlines?apiKey=$_apiKey&country=ar';
    final resp = await http.get(Uri.parse(url));

    final newsResponse = newsResponseFromJson(resp.body);

    headLines.addAll(newsResponse.articles);
    notifyListeners();
  }
}
