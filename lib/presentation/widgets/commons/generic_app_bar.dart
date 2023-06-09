import 'package:flutter/material.dart';

class GenericAppBar extends StatefulWidget {
  const GenericAppBar({super.key});

  @override
  State<GenericAppBar> createState() => GenericAppBarState();
}

class GenericAppBarState extends State<GenericAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      expandedHeight: (MediaQuery.of(context).size.width * 95 / 100) * .6,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text('MY TRIP', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        collapseMode: CollapseMode.parallax,
        background: Container(
          constraints: const BoxConstraints.expand(height: 1000),
          child: Image.asset('assets/images/trip/trip.png', fit: BoxFit.fill),
        ),
      ),
    );
  }
}
