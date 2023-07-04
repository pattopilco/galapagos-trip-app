import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/presentation/providers/menu_provider.dart';

import '../../../features/before/providers/before_information_provider.dart';
import '../../../features/galapagos/providers/gps_information_provider.dart';
import '../../../features/weather/presentation/providers/isla_providers.dart';
import '../../../features/weather/presentation/providers/weather_information_provider.dart';

class GenericAppBar extends ConsumerWidget {
  const GenericAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuItemProv = ref.watch(menuItemProvider);
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

    return SliverAppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      expandedHeight: (MediaQuery.of(context).size.width * 95 / 100) * .6,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(menuItemProv.menuOption.name,
            style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        collapseMode: CollapseMode.parallax,
        background: Container(
          constraints: const BoxConstraints.expand(height: 1000),
          child: Image.asset(menuItemProv.menuOption.image, fit: BoxFit.fill),
        ),
      ),
    );
  }
}
