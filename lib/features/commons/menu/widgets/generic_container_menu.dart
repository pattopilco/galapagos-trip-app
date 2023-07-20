import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/features/commons/menu/widgets/drawer_container_menu.dart';

import '../providers/menu_provider.dart';
import 'generic_app_bar.dart';

class GenericContainerMenu extends ConsumerWidget {
  final Widget body;
  const GenericContainerMenu({super.key, required this.body});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuItemProv = ref.watch(menuItemProvider);
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: CustomScrollView(
          slivers: <Widget>[
            GenericAppBar(
              title: menuItemProv.menuOption.name,
              image:
                  Image.asset(menuItemProv.menuOption.image, fit: BoxFit.fill),
            ),
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
