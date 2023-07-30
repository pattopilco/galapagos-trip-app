import 'package:flutter/material.dart';
import 'package:galapagos_trip_app/config/helpers/whatsapp.dart';
import 'package:galapagos_trip_app/features/emergency/screen/emergency_screen.dart';

class CardContactWidget extends StatelessWidget {
  final Contact contact;
  const CardContactWidget({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        elevation: 8.0,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          height: 200,
          width: 550,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 45, //we give the image a radius of 50
                    backgroundColor: const Color.fromARGB(255, 122, 202, 239),
                    backgroundImage: AssetImage(contact.assets),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        contact.phone,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton.icon(
                        icon: const Icon(
                          // <-- Icon
                          Icons.contact_support,
                          size: 24.0,
                          color: Colors.white,
                        ),
                        style: FilledButton.styleFrom(
                            backgroundColor: const Color(0xff25D366)),
                        onPressed: () {
                          Whatsapp().open(
                              context: context,
                              text: contact.text,
                              number: contact.number);
                        },
                        label: const Text(
                          'WhatsApp Chat',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const SizedBox(width: 32),
              FittedBox(
                alignment: Alignment.centerRight,
                fit: BoxFit.fitWidth,
                child: Text(
                  contact.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
