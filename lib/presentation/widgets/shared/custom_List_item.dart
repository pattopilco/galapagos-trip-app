import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/infraestructure/services/util_file_services.dart';
import 'package:progress_state_button/progress_button.dart';

import '../../../features/trip/presentation/providers/booking_provider.dart';

class CustomListItem extends ConsumerWidget {
  final String code;
  final String cruise;
  const CustomListItem({
    super.key,
    required this.code,
    required this.cruise,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingNoti = ref.watch(bookingProvider.notifier);
    return Column(
      children: [
        Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: _CodeTrip(code: code),
                    ),
                  ],
                ),
                Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: <Widget>[
                      const Padding(
                          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                          child: Text(
                            'Itinerary',
                            style: TextStyle(fontSize: 18),
                          )),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                            ),
                            onPressed: () async {
                              await UtilFileService.openDocument(
                                  'itinerary.pdf');
                            },
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Download',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.download,
                                  size: 24.0,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
                    Row(children: <Widget>[
                      const Padding(
                          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                          child: Text(
                            'Voucher',
                            style: TextStyle(fontSize: 18),
                          )),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                            ),
                            onPressed: () async {
                              await UtilFileService.openDocument('voucher.pdf');
                            },
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Download',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.download,
                                  size: 24.0,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ],
                )
              ],
            ),
          ),
        ),
        ProgressButton(
          stateWidgets: const {
            ButtonState.idle: Text(
              "New",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
            ButtonState.loading: Text(
              "Loading",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
            ButtonState.fail: Text(
              "Fail",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
            ButtonState.success: Text(
              "Success",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            )
          },
          stateColors: {
            ButtonState.idle: Theme.of(context).colorScheme.primary,
            ButtonState.loading: Theme.of(context).colorScheme.secondary,
            ButtonState.fail: Colors.red.shade300,
            ButtonState.success: Colors.green.shade400,
          },
          onPressed: () {
            //ToDo: QUITAR VOUCHER CODE
            bookingNoti.logout();
          },
          state: ButtonState.idle,
          radius: 4.0,
        ),
      ],
    );
  }
}

class _CodeTrip extends StatelessWidget {
  const _CodeTrip({
    required this.code,
  });

  final String code;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.directions_boat_filled),
        Text(
          code,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}
