import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/config/menu/menu_item.dart';
import 'package:galapagos_trip_app/presentation/providers/menu_provider.dart';

import 'drawer_container_menu_header.dart';
import 'list_title_widget.dart';

class DrawerContainerMenu extends ConsumerWidget {
  final Function? onTapListTitle;
  const DrawerContainerMenu({this.onTapListTitle, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuItemProvAsync = ref.watch(menuItemProvider);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: buildMenuList(menuItemProvAsync),
      ),
    );
  }

  List<Widget> buildMenuList(List<MenuItem> menuItemList) {
    List<Widget> menuList = [];

    menuList.add(const DrawerHeaderRoyal(
      appName: 'MY GALAPAGOS TRIP',
      title: 'Menu Options',
    ));
    menuList.add(const Divider());
    menuItemList.asMap().forEach((key, value) {
      menuList.add(ListTitleWidget(
        selected: () {},
        title: value.title,
        icon: value.icon,
        onTap: () {},
      ));
      menuList.add(const Divider());
    });
    return menuList;
  }
}
