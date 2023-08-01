import 'package:flutter/material.dart';
import 'package:galapagos_trip_app/features/commons/internet/check_internet_connection.dart';
import 'package:galapagos_trip_app/features/commons/internet/connection_status_change_notifier.dart';
import 'package:provider/provider.dart';

class WarningWidgetChangeNotifier extends StatelessWidget {
  const WarningWidgetChangeNotifier({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ConnectionStatusChangeNotifier(),
      child: Consumer<ConnectionStatusChangeNotifier>(
          builder: (context, value, child) {
        return Visibility(
          visible: value.status != ConnectionStatus.online,
          child: Container(
            padding: const EdgeInsets.all(16),
            height: 60,
            color: Colors.red,
            child: const Row(
              children: [
                Icon(Icons.wifi_off),
                SizedBox(
                  width: 8,
                ),
                Text('No internet connection'),
              ],
            ),
          ),
        );
      }),
    );
  }
}
