import 'package:flutter/material.dart';

class ArticleCardItem extends StatelessWidget {
  final int id;
  final String image;
  final String category;
  final String title;
  final Function onPress;
  final Function onLongPress;

  ArticleCardItem({
    @required this.id,
    @required this.image,
    @required this.category,
    @required this.title,
    @required this.onPress,
    @required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPress(id),
      onLongPress: () => onLongPress(id),
      child: Container(
        width: 300,
        child: Card(
          elevation: 0,
          color: Colors.transparent,
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                child: FadeInImage.assetNetwork(
                  image: this.image,
                  placeholder: 'assets/images/placeholder.png',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        this.category.toUpperCase(),
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        this.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.subhead,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
