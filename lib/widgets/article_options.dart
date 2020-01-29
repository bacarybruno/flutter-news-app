import 'package:flutter/material.dart';

class ArticleOptions extends StatelessWidget {
  final int id;
  final Function bookmark;
  final Function addFavorite;
  final Function share;
  final Function hideStory;

  ArticleOptions({
    this.id,
    this.bookmark,
    this.addFavorite,
    this.share,
    this.hideStory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 225,
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Lire plus tard'),
            leading: Icon(Icons.bookmark),
            onTap: () => bookmark(id),
          ),
          ListTile(
            title: Text('Ajouter aux favoris'),
            leading: Icon(Icons.favorite),
            onTap: () => addFavorite(id),
          ),
          ListTile(
            title: Text('Partager'),
            leading: Icon(Icons.share),
            onTap: () => share(id),
          ),
          ListTile(
            title: Text('Ajouter à la liste noire'),
            leading: Icon(Icons.block),
            onTap: () => hideStory(id),
          ),
        ],
      ),
    );
  }
}
