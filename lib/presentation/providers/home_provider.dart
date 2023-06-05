import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  bool initialLoading = true;
  Future<void> loadNextPage() async {
    notifyListeners();
  }
}
