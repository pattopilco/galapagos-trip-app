import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/config/config.dart';

import 'config/helpers/util_file_services.dart';
import 'features/before/providers/before_information_provider.dart';
import 'features/commons/internet/check_internet_connection.dart';
import 'features/galapagos/providers/gps_information_provider.dart';
import 'features/weather/presentation/providers/isla_providers.dart';
import 'features/weather/presentation/providers/weather_information_provider.dart';

final internetChecker = CheckInternetConnection();

void main() async {
  await Environment.initEnvironment();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Check Internet
    final internetChecker = CheckInternetConnection();
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
    ownNot.findWeatherForecast(IslaFilter.isabela);
    ownNot.findWeatherForecast(IslaFilter.scristobal);
    ownNot.findWeatherForecast(IslaFilter.scruz);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme().theme(),
    );
  }
}
