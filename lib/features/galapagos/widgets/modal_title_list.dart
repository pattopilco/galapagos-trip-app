import 'package:flutter/material.dart';

class ModalTitleList extends StatelessWidget {
  final String title;
  final bool selected;
  final Function() onTap;
  final TextStyle textStyle;

  const ModalTitleList({
    super.key,
    required this.selected,
    required this.onTap,
    required this.textStyle,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        selected: selected,
        title: Text(
          title,
          style: textStyle,
        ),
        onTap: onTap);
  }
}
