import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/src/models/category_model.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:http/http.dart' as http;

const _urlNews = 'https://newsapi.org/v2';
const _apiKey = '4af5ccd83b9841b79ae063eb12116fe4';

class NewsService with ChangeNotifier {
  List<Article> headLines = [];
  String _selectedCategory = 'business';

  List<Category> categories = [
    Category(
      FontAwesomeIcons.building,
      'business',
    ),
    Category(
      FontAwesomeIcons.tv,
      'entertainment',
    ),
    Category(
      FontAwesomeIcons.addressCard,
      'general',
    ),
    Category(
      FontAwesomeIcons.headSideVirus,
      'health',
    ),
    Category(
      FontAwesomeIcons.vials,
      'science',
    ),
    Category(
      FontAwesomeIcons.football,
      'sports',
    ),
    Category(
      FontAwesomeIcons.memory,
      'technology',
    ),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    getTopHeadlines();
    for (var item in categories) {
      categoryArticles[item.name] = [];
    }
  }

  get selectedCategory => _selectedCategory;
  set selectedCategory(value) {
    _selectedCategory = value;

    getArticlesByCategory(value);
    notifyListeners();
  }

  List<Article>? get getArticlesSelectedCategory =>
      categoryArticles[selectedCategory];

  getTopHeadlines() async {
    const url = '$_urlNews/top-headlines?apiKey=$_apiKey&country=ar';
    final resp = await http.get(Uri.parse(url));

    final newsResponse = newsResponseFromJson(resp.body);

    headLines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    final cArticles = categoryArticles[category] ?? [];

    if (cArticles.isNotEmpty) {
      return cArticles;
    }

    final url =
        '$_urlNews/top-headlines?apiKey=$_apiKey&country=ar&category=$category';
    final resp = await http.get(Uri.parse(url));

    final newsResponse = newsResponseFromJson(resp.body);

    cArticles.addAll(newsResponse.articles);

    notifyListeners();
  }
}
