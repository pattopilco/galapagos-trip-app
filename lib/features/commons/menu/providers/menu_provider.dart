import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/features/commons/menu/domain/entities/menu_item.dart';
import 'package:galapagos_trip_app/features/commons/menu/infraestructure/repositories/menu_option_repository_impl.dart';
import '../domain/entities/menu_option.dart';
import '../infraestructure/datasources/local_menu_option_ds_impl.dart';

//1. Provider

final menuItemProvider = StateNotifierProvider<MenuNotifier, MenuState>((ref) {
  final MenuOption menuOptionBlank = MenuOption(
      id: '0',
      name: 'MY TRIP',
      icon: Icons.card_travel,
      route: '/trip',
      image: 'assets/images/menu/trip.jpg');
  return MenuNotifier(menuOption: menuOptionBlank);
});

//2. Notifier

class MenuNotifier extends StateNotifier<MenuState> {
  final MenuOption menuOption;
  MenuNotifier({required this.menuOption})
      : super(MenuState(menuOption: menuOption));

  List<MenuItem> getListMenuItems() {
    final menuOptionRepository =
        MenuOptionRepositoryImpl(LocalMenuOptionDatasource());
    List<MenuOption> listMenuOptions = [];
    List<MenuItem> listMenuItems = [];
    listMenuOptions = menuOptionRepository.getAllMenuOption();
    for (var item in listMenuOptions) {
      listMenuItems.add(MenuItem(
          id: item.id,
          title: item.name,
          subTitle: item.name,
          link: item.route,
          icon: item.icon));
    }
    return listMenuItems;
  }

  MenuOption _getMenuOption(String id) {
    final menuOptionRepository =
        MenuOptionRepositoryImpl(LocalMenuOptionDatasource());
    List<MenuOption> listMenuOptions = menuOptionRepository.getAllMenuOption();
    List<MenuOption> menuOptionSelect =
        listMenuOptions.where((element) => element.id == id).toList();
    return menuOptionSelect[0];
  }

  void onClickMenu({required String id}) {
    MenuOption menuOption = _getMenuOption(id);
    state = state.copyWith(index: id, menuOption: menuOption);
  }
}

// 3.Estado Menu
class MenuState {
  final String? index;
  final MenuOption menuOption;
  MenuState({this.index, required this.menuOption});
  MenuState copyWith({String? index, required menuOption}) =>
      MenuState(index: index, menuOption: menuOption);
}
