import 'package:flutter/material.dart';
import 'package:galapagos_trip_app/config/router/app_router.dart';
import 'package:galapagos_trip_app/config/theme/app_theme.dart';
import 'package:galapagos_trip_app/infraestructure/datasources/local_menu_option_ds_impl.dart';
import 'package:galapagos_trip_app/infraestructure/repositories/menu_option_repository_impl.dart';
import 'package:galapagos_trip_app/presentation/providers/home_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final menuOptionRepository = MenuOptionRepositoryImpl(
        menuOptionDatasource: LocalMenuOptionDatasource());
    return MultiProvider(
      // Se crea provider a nivel global de la aplicación
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                HomeProvider(menuOptionRepository: menuOptionRepository)
                  ..loadNextPage())
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
        theme: AppTheme().theme(),
      ),
    );
  }
}
