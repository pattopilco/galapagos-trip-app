import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/config/menu/menu_item.dart';
import 'package:galapagos_trip_app/infraestructure/repositories/menu_option_repository_impl.dart';
import '../../domain/entities/menu_option.dart';
import '../../infraestructure/datasources/local_menu_option_ds_impl.dart';

final menuItemProvider = Provider<List<MenuItem>>((ref) {
  final menuOptionRepository =
      MenuOptionRepositoryImpl(LocalMenuOptionDatasource());
  List<MenuOption> listMenuOptions = [];
  List<MenuItem> listMenuItems = [];
  listMenuOptions = menuOptionRepository.getAllMenuOption();
  for (var item in listMenuOptions) {
    listMenuItems.add(MenuItem(
        title: item.name,
        subTitle: item.name,
        link: item.route,
        icon: item.icon));
  }
  return listMenuItems;
});
