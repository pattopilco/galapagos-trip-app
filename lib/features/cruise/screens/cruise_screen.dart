import 'package:flutter/material.dart';

import '../../../presentation/widgets/commons/generic_container.dart';

class CruiseScreen extends StatelessWidget {
  static const name = 'cruise-screen';
  final int cruiceId;
  const CruiseScreen({super.key, required this.cruiceId});

  @override
  Widget build(BuildContext context) {
    return GenericContainer(
      body: AppBar(title: Text('CruiceID: $cruiceId')),
    );
  }
}
