import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0xff293643),
    );
  }
}

class HeaderBordeRedondeado extends StatelessWidget {
  const HeaderBordeRedondeado({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.black,
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Color(0xff293643),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: const Column(
        children: [
          SizedBox(height: 10),
          Text(
            'Welcome to\nMy Galapagos Trip',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Align(
            alignment: Alignment.topRight,
            child: OutlinedButtonExample(),
          ),
        ],
      ),
    );
  }
}

class OutlinedButtonExample extends StatelessWidget {
  const OutlinedButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        debugPrint('Received click');
      },
      child: const Text('Enter'),
    );
  }
}
