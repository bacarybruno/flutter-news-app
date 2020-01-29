import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_news_app/models/article.dart';
import 'package:flutter_news_app/constants.dart';

class ArticlesProvider with ChangeNotifier {
  final _pageSize = 20;
  int _page;
  int _categoryId;

  List<Article> _articles = [];

  Future<List<Article>> fetchArticles(int categoryId, [int page = 1]) async {
    _page = page;
    if (categoryId != _categoryId) {
      _categoryId = categoryId;
      _articles.clear();
    }
    final categoryQuery = categoryId > 0 ? '&categories=$categoryId' : '';
    final url =
        '${Constants['API_BASE_URL']}/posts?per_page=$_pageSize&page=$_page&_embed&$categoryQuery';
    try {
      var response = await http.get(url);
      var data = json.decode(response.body);
      _articles.addAll(_formatArticle(data, categoryId));
      return Future.value(_articles);
    } catch (e) {
      return Future.error('An error occured');
    }
  }

  Future<void> refresh() async {
    _articles.clear();
    notifyListeners();
    await fetchArticles(_categoryId, 1);
  }

  Future<void> nextPage() async {
    await fetchArticles(_categoryId, _page + 1);
  }

  Article findById(int id) =>
      this._articles.firstWhere((article) => article.id == id);

  List<Article> _formatArticle(List<dynamic> jsonData, int categoryId) {
    return jsonData.map((json) {
      var _embedded = json['_embedded'];

      Map<String, dynamic> media;
      try {
        media = _embedded['wp:featuredmedia'][0]['media_details']['sizes'];
      } catch (e) {}

      return Article(
        id: json['id'],
        author: _embedded['author'][0]['name'],
        banner: media == null ? '' : media['full']['source_url'],
        thumbnail: media == null ? '' : media['thumbnail']['source_url'],
        title: json['title']['rendered'],
        category: _embedded['wp:term'][0]
            .lastWhere((term) => term['taxonomy'] == 'category')['name'],
        description: json['excerpt']['rendered'],
        htmlContent: json['content']['rendered'],
        createdAt: DateTime.parse(json['date']),
        tag: null,
      );
    }).toList();
  }

  List<Article> get articles => [..._articles];
}
