import 'package:flutter/material.dart';
import 'menu_icon_silver_app_bar.dart';

class GenericAppBar extends StatelessWidget {
  final Widget? image;
  final String title;
  const GenericAppBar({this.image, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: const MenuIconSilverAppBar(),
      backgroundColor: Theme.of(context).colorScheme.primary,
      expandedHeight: (MediaQuery.of(context).size.width * 95 / 100) * .5,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        collapseMode: CollapseMode.parallax,
        //background: Container(
        //    constraints: const BoxConstraints.expand(height: 1000),
        //    child: image),
        background: Stack(
          children: [
            SizedBox.expand(
              child: image,
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.7, 1.0],
                        colors: [Colors.transparent, Colors.black87])),
              ),
            )
          ],
        ),
      ),
    );
  }
}
