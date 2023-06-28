import 'package:flutter/material.dart';

class WrapWidget extends StatelessWidget {
  final Widget? widget;
  final double width;
  final Color? color;
  const WrapWidget({super.key, required this.width, this.widget, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: width,
      child: widget,
    );
  }
}
