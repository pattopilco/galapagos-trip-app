import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:galapagos_trip_app/features/commons/internet/connection_status_change_notifier.dart';
import 'package:galapagos_trip_app/features/commons/internet/check_internet_connection.dart';
import 'package:galapagos_trip_app/features/trip/presentation/providers/booking_provider.dart';

import '../presentation/providers/trip_form_provider.dart';

class SearchWidgetChangeNotifier extends StatelessWidget {
  const SearchWidgetChangeNotifier({
    super.key,
    required this.bookingProv,
    required this.tripFormNoti,
  });
  final BookingState bookingProv;
  final TripFormNotifier tripFormNoti;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ConnectionStatusChangeNotifier(),
      child: Consumer<ConnectionStatusChangeNotifier>(
        builder: (context, value, child) {
          return FilledButton(
            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: bookingProv.bookingStatus == BookingStatus.checking
                  ? const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Text('Please Wait'),
                      ],
                    )
                  : value.status == ConnectionStatus.online
                      ? const Text(
                          'Search',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      : const Icon(
                          Icons.wifi_off,
                          size: 25,
                          color: Colors.white,
                        ),
            ),
            onPressed: () async {
              if (value.status == ConnectionStatus.online) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                FocusManager.instance.primaryFocus?.unfocus();
                tripFormNoti.onFormSubmit();
              }
            },
          );
        },
      ),
    );
  }
}
