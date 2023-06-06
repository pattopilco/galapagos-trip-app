import 'package:flutter/material.dart';
import 'package:galapagos_trip_app/domain/repositories/menu_option_repository.dart';
import '../../domain/entities/menu_option.dart';

class HomeProvider extends ChangeNotifier {
  final MenuOptionRepository menuOptionRepository;

  bool initialLoading = true;
  List<MenuOption> listMenuOptions = [];
  HomeProvider({required this.menuOptionRepository});
  Future<void> loadNextPage() async {
    final result = await menuOptionRepository.getAllMenuOption();
    listMenuOptions.addAll(result);
    initialLoading = false;
    notifyListeners();
  }
}
