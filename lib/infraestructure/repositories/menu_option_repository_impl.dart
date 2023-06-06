import 'package:galapagos_trip_app/domain/datasources/menu_option_datasource.dart';
import 'package:galapagos_trip_app/domain/entities/menu_option.dart';

import '../../domain/repositories/menu_option_repository.dart';

class MenuOptionRepositoryImpl implements MenuOptionRepository {
  final MenuOptionDatasource menuOptionDatasource;

  MenuOptionRepositoryImpl({required this.menuOptionDatasource});

  @override
  Future<List<MenuOption>> getAllMenuOption() {
    return menuOptionDatasource.getAllMenuOption();
  }
}
