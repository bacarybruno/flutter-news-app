import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleListItem extends StatelessWidget {
  final int id;
  final String image;
  final String category;
  final String title;
  final Function onPress;
  final Function onLongPress;
  final DateTime date;

  ArticleListItem({
    @required this.id,
    @required this.image,
    @required this.category,
    @required this.title,
    @required this.onPress,
    @required this.onLongPress,
    @required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(this.category),
      subtitle: Column(
        children: <Widget>[
          Text(
            this.title,
            maxLines: 3,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subhead,
          ),
          SizedBox(height: 5),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              timeago.format(date, locale: 'fr'),
              maxLines: 1,
            ),
          ),
        ],
      ),
      dense: true,
      trailing: FadeInImage.assetNetwork(
        image: this.image,
        placeholder: 'assets/images/placeholder.png',
        width: 100,
        fit: BoxFit.cover,
      ),
      onTap: () => onPress(id),
      onLongPress: () => onLongPress(id),
    );
  }
}
