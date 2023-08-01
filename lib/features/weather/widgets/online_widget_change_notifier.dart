import 'package:flutter/material.dart';
import 'package:galapagos_trip_app/features/commons/internet/check_internet_connection.dart';
import 'package:galapagos_trip_app/features/commons/internet/connection_status_change_notifier.dart';
import 'package:provider/provider.dart';

import 'galapagos_weather.dart';

class OnlineWidgetChangeNotifier extends StatelessWidget {
  const OnlineWidgetChangeNotifier({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ConnectionStatusChangeNotifier(),
      child: Consumer<ConnectionStatusChangeNotifier>(
          builder: (context, value, child) {
        return Visibility(
          visible: value.status == ConnectionStatus.online,
          child: const GalapagosWeather(),
        );
      }),
    );
  }
}
