import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_news_app/models/article_category.dart';

import 'package:flutter_news_app/widgets/category_selector.dart';
import 'package:flutter_news_app/providers/categories.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  Future<List<ArticleCategory>> _fetchCategories;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final categoriesProvider =
          Provider.of<CategoriesProvider>(context, listen: false);
      _fetchCategories = categoriesProvider.fetchAllCategories();
    });
  }

  void _chooseCategory(int id) {
    final categoriesProvider =
        Provider.of<CategoriesProvider>(context, listen: false);
    categoriesProvider.selectCategory(id);
  }

  @override
  Widget build(BuildContext context) {
    final categoriesProvider = Provider.of<CategoriesProvider>(context);
    return Container(
      height: 50,
      child: FutureBuilder(
        future: _fetchCategories,
        initialData: [],
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Container()
            : snapshot.hasError
                ? Text(snapshot.error)
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) =>
                        categoriesProvider.categories.length == 0
                            ? Container()
                            : CategorySelector(
                                id: categoriesProvider.categories[index].id,
                                name: categoriesProvider.categories[index].name,
                                onPressed: _chooseCategory,
                                isSelected: categoriesProvider.isSelected(
                                    categoriesProvider.categories[index]),
                              ),
                    itemCount: snapshot.hasData
                        ? categoriesProvider.categories.length
                        : 0,
                  ),
      ),
    );
  }
}
