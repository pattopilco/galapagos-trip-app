import 'package:flutter/material.dart';
import 'package:galapagos_trip_app/features/commons/menu/widgets/generic_container.dart';
import '../widgets/header_boat.dart';
import '../widgets/tab_bar_boat.dart';

class CruiseScreen extends StatelessWidget {
  const CruiseScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GenericContainer(
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            HeaderBoat(),
            DefaultTabController(
              length: 4,
              initialIndex: 0,
              child: TabBarBoat(),
            ),
          ],
        ),
      ),
    );
  }
}
