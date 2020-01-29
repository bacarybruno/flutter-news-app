import 'package:flutter/material.dart';

import 'package:flutter_news_app/pages/home_page.dart';
import 'package:flutter_news_app/pages/favorites_page.dart';
import 'package:flutter_news_app/pages/bookmarks_page.dart';

class Tabbar extends StatefulWidget {
  static final routeName = '/';
  @override
  _TabbarState createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  var _currentIndex = 0;

  final List<Widget> _children = [
    HomePage(),
    FavoritesPage(),
    BookmarksPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Accueil'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.favorite),
            title: new Text('Favoris'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch_later),
            title: Text('Signets'),
          )
        ],
        onTap: onTabTapped,
      ),
    );
  }
}
