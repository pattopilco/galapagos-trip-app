import 'package:flutter/material.dart';
import 'package:galapagos_trip_app/presentation/widgets/commons/drawer_container_menu.dart';
import 'package:galapagos_trip_app/presentation/widgets/commons/generic_app_bar.dart';

class GenericContainerMenu extends StatelessWidget {
  final Widget body;
  const GenericContainerMenu({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: CustomScrollView(
          slivers: <Widget>[
            const GenericAppBar(),
            SliverToBoxAdapter(
              child: body,
            )
          ],
        ),
      ),
      drawer: const DrawerContainerMenu(),
    );
  }
}
