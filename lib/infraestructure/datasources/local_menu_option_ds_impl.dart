import 'package:galapagos_trip_app/domain/datasources/menu_option_datasource.dart';
import 'package:galapagos_trip_app/domain/entities/menu_option.dart';

import '../../shared/data/local_menu_options.dart';
import '../models/local_menu_options_model.dart';

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
