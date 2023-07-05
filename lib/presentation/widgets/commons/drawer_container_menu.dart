import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/config/menu/menu_item.dart';
import 'package:galapagos_trip_app/presentation/providers/menu_provider.dart';
import 'package:go_router/go_router.dart';
import '../../../features/trip/presentation/providers/booking_provider.dart';
import 'drawer_container_menu_header.dart';

class DrawerContainerMenu extends ConsumerWidget {
  final Function? onTapListTitle;
  const DrawerContainerMenu({this.onTapListTitle, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuItemProv = ref.watch(menuItemProvider.notifier);
    final bookingProv = ref.watch(bookingProvider);
    final bool authenticated =
        bookingProv.bookingStatus == BookingStatus.authenticated;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: buildMenuList(context, menuItemProv.getListMenuItems(),
            menuItemProv, authenticated),
      ),
    );
  }

  List<Widget> buildMenuList(BuildContext context, List<MenuItem> menuItemList,
      MenuNotifier menuItemProv, bool authenticated) {
    List<Widget> menuList = [];
    menuList.add(const DrawerHeaderRoyal(
      appName: 'MY GALAPAGOS TRIP',
      title: 'Menu Options',
    ));

    if (!authenticated) {
      menuItemList.removeAt(1);
    }

    menuList.add(const Divider());
    menuItemList.asMap().forEach((index, value) {
      menuList.add(
        ListTile(
          selected: value.id == menuItemProv.state.index,
          leading: Icon(value.icon),
          title: Text(
            value.title,
            style: _style1,
          ),
          onTap: () {
            menuItemProv.onClickMenu(id: value.id);
            context.go(value.link);
          },
        ),
      );
      //menuList.add(const Divider());
    });
    return menuList;
  }
}

const TextStyle _style1 = TextStyle(
  //fontWeight: FontWeight.w700,
  color: Color(0xff293643),
  fontSize: 14,
);
