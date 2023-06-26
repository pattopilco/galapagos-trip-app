import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/config/config.dart';

void main() async {
  await Environment.initEnvironment();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme().theme(),
    );
  }

/*



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
*/
}
