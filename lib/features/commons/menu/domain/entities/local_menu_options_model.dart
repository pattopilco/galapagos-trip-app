import 'package:flutter/material.dart';
import 'package:galapagos_trip_app/features/commons/menu/domain/entities/menu_option.dart';

class LocalMenuOptionModel {
  final String id;
  final String name;
  final IconData icon;
  final String route;
  final String image;

  LocalMenuOptionModel(
      {required this.id,
      required this.name,
      required this.icon,
      required this.route,
      required this.image});

  factory LocalMenuOptionModel.fromJson(Map<String, dynamic> json) =>
      LocalMenuOptionModel(
        id: json['id'],
        name: json['name'],
        icon: json['icon'],
        route: json['route'],
        image: json['image'],
      );
  MenuOption toMenuOptionsEntity() => MenuOption(
        id: id,
        name: name,
        icon: icon,
        route: route,
        image: image,
      );
}
