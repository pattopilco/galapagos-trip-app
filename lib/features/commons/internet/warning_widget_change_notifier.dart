import 'package:flutter/material.dart';
import 'package:galapagos_trip_app/features/commons/internet/check_internet_connection.dart';
import 'package:galapagos_trip_app/features/commons/internet/connection_status_change_notifier.dart';
import 'package:provider/provider.dart';

import '../../../config/helpers/responsive.dart';
import '../../galapagos/widgets/wrap_widget.dart';

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
            child: Card(
              child: Column(
                children: <Widget>[
                  Padding(
                    // padding: EdgeInsets.all(Responsive(context).wp(100) * 0.05),
                    padding: const EdgeInsets.all(40),
                    child: Column(children: <Widget>[
                      Icon(
                        Icons.wifi_off,
                        size: 50,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      WrapWidget(
                        width: Responsive(context).widthp(100),
                        widget: Text(
                          'Internet connection is required to open this section',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w900,
                              fontSize: Responsive(context).inchp(8) * 0.2),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
