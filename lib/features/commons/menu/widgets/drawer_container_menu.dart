import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/features/commons/menu/domain/entities/menu_item.dart';
import 'package:galapagos_trip_app/features/commons/menu/providers/menu_provider.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/helpers/utils.dart';
import '../../../trip/presentation/providers/booking_provider.dart';
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
            menuItemProv, authenticated,
            divider: false),
      ),
    );
  }

  List<Widget> buildMenuList(BuildContext context, List<MenuItem> menuItemList,
      MenuNotifier menuItemProv, bool authenticated,
      {required divider}) {
    List<Widget> menuList = [];
    menuList.add(const DrawerHeaderRoyal(
      appName: 'MY GALAPAGOS TRIP',
      title: 'Menu Options',
    ));

    if (!authenticated) {
      menuItemList.removeAt(1);
    }

    menuList.add(divider == true ? const Divider() : const SizedBox());
    menuItemList.asMap().forEach((index, value) {
      menuList.add(
        ListTile(
          selected: value.id == menuItemProv.state.index,
          leading: Icon(value.icon),
          title: Text(
            value.title,
            style: StyleUtil.styleColorPrimaryFont14(context),
          ),
          onTap: () {
            menuItemProv.onClickMenu(id: value.id);
            context.go(value.link);
          },
        ),
      );
      menuList.add(divider == true ? const Divider() : const SizedBox());
    });
    return menuList;
  }
}
