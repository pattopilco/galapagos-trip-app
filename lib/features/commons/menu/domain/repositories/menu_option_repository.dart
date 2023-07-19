import 'package:galapagos_trip_app/features/commons/menu/domain/entities/menu_option.dart';

abstract class MenuOptionRepository {
  List<MenuOption> getAllMenuOption();
}
