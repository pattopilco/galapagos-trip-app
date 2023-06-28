import 'package:flutter/material.dart';

List<Map<String, dynamic>> listMenuOption = [
  {
    'id': '0',
    'name': 'MY TRIP',
    'icon': Icons.card_travel,
    'route': '/trip',
    'image': 'assets/images/menu/trip.png',
  },
  {
    'id': '1',
    'name': 'MY CRUISE',
    'icon': Icons.directions_boat,
    'route': '/cruise',
    'image': 'assets/data/boat/all-boats.png'
  },
  {
    'id': '2',
    'name': 'BEFORE MY TRIP',
    'icon': Icons.question_answer,
    'route': '/before',
    'image': 'assets/images/before/information_front.jpg'
  },
  {
    'id': '3',
    'name': 'THE GALAPAGOS ISLANDS',
    'icon': Icons.map,
    'route': '/galapagos',
    'image': 'assets/images/menu/trip_gps.png',
  },
  {
    'id': '4',
    'name': 'WEATHER',
    'icon': Icons.cloud_queue,
    'route': '/weather',
    'image': 'assets/images/menu/weather_gps.png',
  },
  {
    'id': '5',
    'name': 'EMERGENCY CONTACT',
    'icon': Icons.contact_phone,
    'route': '/emergency',
    'image': 'assets/images/menu/contact_emergency.png',
  },
];
