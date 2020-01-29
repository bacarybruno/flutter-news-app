import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_news_app/constants.dart';
import 'package:flutter_news_app/models/article_category.dart';

class CategoriesProvider extends ChangeNotifier {
  List<ArticleCategory> _categories;
  List<ArticleCategory> _allCategories;

  var _categoriesDisplayCount = 15;
  int _selectedCategoryId;

  Future<List<ArticleCategory>> fetchAllCategories() async {
    final url = '${Constants['API_BASE_URL']}/categories?per_page=100';
    try {
      var response = await http.get(url);
      var data = json.decode(response.body);
      _categories = _formatArticleCategory(data);
      if (_selectedCategoryId == null) {
        _selectedCategoryId = categories.first.id;
        notifyListeners();
      }
      return Future.value(_categories);
    } catch (e) {
      return Future.error('An error occured');
    }
  }

  List<ArticleCategory> _formatArticleCategory(dynamic jsonData) {
    List<ArticleCategory> categories = [];
    for (var index = 0; index < jsonData.length; index++) {
      var json = jsonData[index];
      categories.add(ArticleCategory(
        id: json['id'],
        name: json['name'],
        count: json['count'],
      ));
    }
    categories.sort(
      (current, other) => other.count.compareTo(current.count),
    );
    return categories;
  }

  void selectCategory(int id) {
    _selectedCategoryId = id;
    notifyListeners();
  }

  List<ArticleCategory> get categories => _categories != null
      ? _categories.take(_categoriesDisplayCount).toList()
      : [];

  List<ArticleCategory> get allCategories => _categories ?? [];

  ArticleCategory get currentCategory =>
      _selectedCategoryId == null ? null : findById(_selectedCategoryId);

  ArticleCategory findById(int id) => id == null
      ? null
      : categories.firstWhere((category) => category.id == id);

  bool isSelected(ArticleCategory category) =>
      category.id == _selectedCategoryId;
}
