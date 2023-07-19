import 'package:flutter/material.dart';
import 'package:galapagos_trip_app/features/emergency/presentation/widgets/card_contact.dart';
import '../../commons/menu/widgets/generic_container_menu.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericContainerMenu(
      body: Center(
        child: Column(
          children: [
            //CardContactWidget(contact: _contacts[0]),
            CardContactWidget(contact: _contacts[1]),
          ],
        ),
      ),
    );
  }
}

class Contact {
  final String phone;
  final String title;
  final String image;
  final String number;
  final String text;
  final String assets;
  Contact(
      {required this.phone,
      required this.title,
      required this.image,
      required this.number,
      required this.text,
      required this.assets});
}

final List<Contact> _contacts = [
  Contact(
      phone: '+(593) 9 80526906',
      title: 'Sales Department Contact',
      image: 'assets/images/emergency/avatar_1.png',
      number: '593980526906',
      text: 'Hello, can you help me?',
      assets: 'assets/images/emergency/avatar_1.png'),
  Contact(
      phone: '+(593) 9 84298531',
      title: 'Operations Department Contact',
      image: 'assets/images/emergency/avatar_2.png',
      number: '593984298531',
      text: 'Hello, can you help me?',
      assets: 'assets/images/emergency/avatar_2.png'),
];
