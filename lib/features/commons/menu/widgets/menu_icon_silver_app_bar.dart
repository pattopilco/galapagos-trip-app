import 'package:flutter/material.dart';

class MenuIconSilverAppBar extends StatelessWidget {
  const MenuIconSilverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: Colors.black26,
        child: IconButton(
          iconSize: 22,
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
    ));
  }
}
