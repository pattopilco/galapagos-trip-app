import 'package:flutter/material.dart';
import 'package:galapagos_trip_app/domain/entities/menu_option.dart';

class MenuScrollableView extends StatelessWidget {
  final List<MenuOption> listMenuOption;

  const MenuScrollableView({super.key, required this.listMenuOption});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Container(
          color: Colors.purpleAccent,
        ),
        Container(
          color: Colors.black,
        )
      ],
    );
  }
}
