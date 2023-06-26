import 'package:flutter/material.dart';

class MenuItem {
  final String id;
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  MenuItem(
      {required this.id,
      required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}
