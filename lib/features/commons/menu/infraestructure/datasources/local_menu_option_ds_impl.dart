import 'package:galapagos_trip_app/features/commons/menu/datasources/menu_option_datasource.dart';
import 'package:galapagos_trip_app/features/commons/menu/domain/entities/menu_option.dart';

import '../../data/local_menu_options.dart';
import '../../domain/entities/local_menu_options_model.dart';

class LocalMenuOptionDatasource implements MenuOptionDatasource {
  @override
  List<MenuOption> getAllMenuOption() {
    final List<MenuOption> newListMenuOption = listMenuOption
        .map(
            (menu) => LocalMenuOptionModel.fromJson(menu).toMenuOptionsEntity())
        .toList();
    return newListMenuOption;
  }
}
