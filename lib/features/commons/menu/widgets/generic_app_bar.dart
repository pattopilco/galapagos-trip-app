import 'package:flutter/material.dart';
import 'menu_icon_silver_app_bar.dart';

class GenericAppBar extends StatelessWidget {
  final Widget? image;
  final String title;
  const GenericAppBar({this.image, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: const MenuIconSilverAppBar(),
      backgroundColor: Theme.of(context).colorScheme.primary,
      expandedHeight: (MediaQuery.of(context).size.width * 95 / 100) * .5,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(title, style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        collapseMode: CollapseMode.parallax,
        background: Container(
            constraints: const BoxConstraints.expand(height: 1000),
            child: image),
      ),
    );
  }
}

/* Borrar si esta pintando bien las imagenes de la cabecera
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
*/
