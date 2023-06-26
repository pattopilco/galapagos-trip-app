import 'package:galapagos_trip_app/domain/datasources/menu_option_datasource.dart';
import 'package:galapagos_trip_app/domain/entities/menu_option.dart';
import '../../domain/repositories/menu_option_repository.dart';

class MenuOptionRepositoryImpl extends MenuOptionRepository {
  final MenuOptionDatasource datasource;
  MenuOptionRepositoryImpl(this.datasource);
  @override
  List<MenuOption> getAllMenuOption() {
    return datasource.getAllMenuOption();
  }
}
