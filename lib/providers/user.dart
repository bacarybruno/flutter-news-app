import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  List<int> _favorites = [];
  List<int> _bookmarks = [];
  List<int> _trash = [];

  List<int> get favorites => [..._favorites];
  List<int> get bookmarks => [..._bookmarks];
  List<int> get trash => [..._trash];

  void addFavorite(int articleId) {
    _favorites.add(articleId);
  }

  void deleteFavorite(int articleId) {
    _favorites.removeWhere((favorite) => favorite == articleId);
  }

  bool isFavorite(int articleId) => _favorites.indexOf(articleId) >= 0;

  void addBookmark(int articleId) {
    _bookmarks.add(articleId);
  }

  void deleteBookmark(int articleId) {
    _bookmarks.removeWhere((bookmark) => bookmark == articleId);
  }

  bool isBookmarked(int articleId) => _bookmarks.indexOf(articleId) >= 0;

  void hideArticle(int articleId) {
    _trash.add(articleId);
  }

  void unhideArticle(int articleId) {
    _trash.removeWhere((t) => t == articleId);
  }

  bool isHidden(int articleId) => _trash.indexOf(articleId) >= 0;
}
