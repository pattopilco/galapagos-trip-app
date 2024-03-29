import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/features/commons/menu/widgets/generic_container.dart';
import '../../trip/presentation/providers/booking_provider.dart';
import '../widgets/header_boat.dart';
import '../widgets/tab_bar_boat.dart';

class CruiseScreen extends ConsumerWidget {
  const CruiseScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingProv = ref.watch(bookingProvider);
    final bool authenticated =
        bookingProv.bookingStatus == BookingStatus.authenticated;
    return GenericContainer(
        authenticated: authenticated,
        body: Container(
          color: Theme.of(context).colorScheme.primary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              HeaderBoat(
                authenticated: authenticated,
              ),
              DefaultTabController(
                length: 4,
                initialIndex: 0,
                child: TabBarBoat(authenticated: authenticated),
              ),
            ],
          ),
        ));
  }
}
