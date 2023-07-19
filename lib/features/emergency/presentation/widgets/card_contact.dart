import 'package:flutter/material.dart';
import 'package:galapagos_trip_app/config/helpers/whatsapp.dart';
import 'package:galapagos_trip_app/features/emergency/screen/emergency_screen.dart';

class CardContactWidget extends StatelessWidget {
  final Contact contact;
  const CardContactWidget({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Card(
      //clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            //leading: const Icon(Icons.contact_emergency),
            title: Text(contact.title,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(
              contact.phone,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(contact.assets),
                ),
                ElevatedButton.icon(
                  icon: const Icon(
                    // <-- Icon
                    Icons.comment,
                    size: 24.0,
                    color: Colors.white,
                  ),
                  style: FilledButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary),
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
              ])),
        ],
      ),
    );
  }
}
