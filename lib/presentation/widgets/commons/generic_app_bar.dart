import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/presentation/providers/menu_provider.dart';

class GenericAppBar extends ConsumerWidget {
  const GenericAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuItemProv = ref.watch(menuItemProvider);

    return SliverAppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      expandedHeight: (MediaQuery.of(context).size.width * 95 / 100) * .6,
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
