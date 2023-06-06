import 'package:flutter/material.dart';
import 'package:galapagos_trip_app/config/menu/menu_item.dart';
import 'package:galapagos_trip_app/domain/repositories/menu_option_repository.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:string_2_icon/string_2_icon.dart';
import '../../domain/entities/menu_option.dart';

class HomeProvider extends ChangeNotifier {
  final MenuOptionRepository menuOptionRepository;

  bool initialLoading = true;
  List<MenuOption> listMenuOptions = [];
  List<MenuItem> listMenuItems = [];
  HomeProvider({required this.menuOptionRepository});

  Future<void> loadNextPage() async {
    final result = await menuOptionRepository.getAllMenuOption();
    listMenuOptions.addAll(result);
    loadMenuItems();
    initialLoading = false;
    notifyListeners();
  }

  void loadMenuItems() {
    for (var item in listMenuOptions) {
      listMenuItems.add(MenuItem(
          title: item.name,
          subTitle: item.name,
          link: item.route,
          icon: item.icon));
    }
  }
}
