import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/presentation/providers/menu_provider.dart';

class GenericAppBar extends ConsumerWidget {
  const GenericAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuItemProv = ref.watch(menuItemProvider);
    return SliverAppBar(
      leading: GestureDetector(
          child: IconButton.filled(
        color: Colors.red,
        iconSize: 24,
        icon: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        onPressed: () => Scaffold.of(context).openDrawer(),
      )),
      backgroundColor: Theme.of(context).colorScheme.primary,
      expandedHeight: (MediaQuery.of(context).size.width * 95 / 100) * .5,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(menuItemProv.menuOption.name,
            style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        collapseMode: CollapseMode.parallax,
        background: Container(
          constraints: const BoxConstraints.expand(height: 1000),
          child: Image.asset(menuItemProv.menuOption.image, fit: BoxFit.fill),
        ),
      ),
    );
  }
}
