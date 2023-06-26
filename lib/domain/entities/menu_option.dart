import 'package:flutter/material.dart';

class MenuOption {
  final String id;
  final String name;
  final IconData icon;
  final String route;
  final String image;

  MenuOption(
      {required this.id,
      required this.name,
      required this.icon,
      required this.route,
      required this.image});
}
