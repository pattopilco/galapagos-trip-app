import 'package:flutter/material.dart';
import 'package:galapagos_trip_app/presentation/providers/home_provider.dart';
import 'package:galapagos_trip_app/presentation/widgets/shared/menu_scrollable_view.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = context.watch<HomeProvider>();
    return Scaffold(
        body: homeProvider.initialLoading
            ? const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              )
            : MenuScrollableView(listMenuOption: homeProvider.listMenuOptions));
  }
}
