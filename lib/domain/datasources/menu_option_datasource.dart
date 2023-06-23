import 'package:galapagos_trip_app/domain/entities/menu_option.dart';

abstract class MenuOptionDatasource {
  List<MenuOption> getAllMenuOption();
}
