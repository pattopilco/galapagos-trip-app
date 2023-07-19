import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/features/commons/menu/providers/menu_provider.dart';

class GenericAppBar extends ConsumerWidget {
  const GenericAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuItemProv = ref.watch(menuItemProvider);
    return SliverAppBar(
      leading: const MenuIconSilverAppBar(),
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

class MenuIconSilverAppBar extends StatelessWidget {
  const MenuIconSilverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: Colors.black26,
        child: IconButton(
          iconSize: 22,
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
    ));
  }
}
