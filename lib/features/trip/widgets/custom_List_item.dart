import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/config/helpers/util_file_services.dart';
import 'package:go_router/go_router.dart';
import 'package:progress_state_button/progress_button.dart';

import '../presentation/providers/booking_provider.dart';
import '../presentation/providers/trip_form_provider.dart';

class CustomListItem extends ConsumerWidget {
  final String pathLocalStorage;
  final String code;
  final String cruise;
  final String dateSearch;
  const CustomListItem({
    required this.dateSearch,
    required this.pathLocalStorage,
    super.key,
    required this.code,
    required this.cruise,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingNoti = ref.watch(bookingProvider.notifier);
    return Column(children: [
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
              const Divider(),
              Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(Icons.picture_as_pdf_outlined),
                    ),
                    const Padding(
                        padding: EdgeInsets.fromLTRB(3, 3, 15, 3),
                        child: Text(
                          'Itinerary',
                          style: TextStyle(fontSize: 16),
                        )),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 3, 10, 3),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                          ),
                          onPressed: () async {
                            await UtilFileService.openDocument('itinerary.pdf');
                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'View Document',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.download_done,
                                size: 20.0,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
                  Row(children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(Icons.picture_as_pdf_outlined),
                    ),
                    const Padding(
                        padding: EdgeInsets.fromLTRB(3, 3, 15, 3),
                        child: Text(
                          'Voucher',
                          style: TextStyle(fontSize: 16),
                        )),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 3, 10, 10),
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
                                'View Document',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.download_done,
                                size: 20.0,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
              Text(
                'Created At: $dateSearch',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 20),
      SizedBox(
        width: double.infinity,
        child: FilledButton(
            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
            ),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'New Search',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            onPressed: () async {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              FocusManager.instance.primaryFocus?.unfocus();
              ref.read(tripFormProvider.notifier).touchLogout();
              bookingNoti.logout();
              context.go("/trip");
            }),
      ),
    ]);
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
