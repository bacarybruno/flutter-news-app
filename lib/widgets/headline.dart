import 'package:flutter/material.dart';

class Headline extends StatelessWidget {
  final String title;

  Headline(this.title);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(this.title),
    );
  }
}
