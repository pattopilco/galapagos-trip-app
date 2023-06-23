import 'package:flutter/material.dart';

class ListTitleWidget extends StatefulWidget {
  final title;
  final icon;
  final selected;
  final Function? onTap;
  final TextStyle? textStyle;

  const ListTitleWidget(
      {Key? key,
      this.title,
      this.icon,
      this.selected = false,
      this.onTap,
      this.textStyle})
      : super(key: key);

  @override
  _ListTitleWidgetState createState() => _ListTitleWidgetState();
}

class _ListTitleWidgetState extends State<ListTitleWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: widget.selected,
      title: Text(
        widget.title,
        style: widget.textStyle,
      ),
      leading: Icon(widget.icon),
      //onTap: widget.onTap
    );
    ;
  }
}
