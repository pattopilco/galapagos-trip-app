import 'package:galapagos_trip_app/domain/entities/menu_option.dart';

abstract class MenuOptionRepository {
  Future<List<MenuOption>> getAllMenuOption();
}
