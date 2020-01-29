import 'package:flutter/material.dart';

class CategorySelector extends StatelessWidget {
  final String name;
  final int id;
  final Function onPressed;
  final bool isSelected;

  CategorySelector({
    @required this.name,
    @required this.onPressed,
    @required this.id,
    @required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(name.toUpperCase()),
      onPressed: () => onPressed(id),
      textColor: isSelected ? Colors.red : null,
    );
  }
}
