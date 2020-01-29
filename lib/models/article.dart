import 'package:flutter/foundation.dart';

class Article {
  int id;
  String banner;
  String thumbnail;
  String author;
  String tag;
  String category;
  String title;
  String htmlContent;
  String description;
  DateTime createdAt;

  Article({
    @required this.banner,
    @required this.thumbnail,
    @required this.author,
    @required this.title,
    @required this.category,
    @required this.id,
    @required this.htmlContent,
    @required this.description,
    @required this.createdAt,
    this.tag,
  });
}
