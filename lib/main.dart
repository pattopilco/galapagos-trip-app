import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/config/config.dart';

import 'features/before/providers/before_information_provider.dart';
import 'features/galapagos/providers/gps_information_provider.dart';
import 'features/weather/presentation/providers/isla_providers.dart';
import 'features/weather/presentation/providers/weather_information_provider.dart';

void main() async {
  await Environment.initEnvironment();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Carga Inicial de datos Before
    final beforeInformationNoti = ref.watch(beforeInformationProvider.notifier);
    beforeInformationNoti.selectBeforeInformation(0);
    final informationNoti = ref.watch(informationProvider.notifier);
    informationNoti.selectInformation(0);
    //Carga Inicial de datos Weather
    final weatherInformationNoti =
        ref.watch(weatherInformationProvider.notifier);
    weatherInformationNoti.selectWeatherInformation(0);
    //Carga Inicial de Islas
    final ownNot = ref.watch(owmProvider.notifier);
    const lat = '-0.63333';
    const long = '-90.36667';
    ownNot.findWeatherForecast(lat, long);

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
