import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/features/cruise/widgets/tab_bar_view_boat_spec.dart';
import 'package:galapagos_trip_app/features/cruise/widgets/tab_bar_view_cruise.dart';
import 'package:galapagos_trip_app/features/cruise/widgets/tab_bar_view_gallery.dart';
import 'package:galapagos_trip_app/features/cruise/widgets/tab_bar_view_manual.dart';

import '../../../config/helpers/responsive.dart';
import '../../trip/presentation/providers/booking_provider.dart';
import 'no_authenticated_boat.dart';

class TabBarBoat extends ConsumerWidget {
  final bool authenticated;
  const TabBarBoat({
    required this.authenticated,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingProv = ref.watch(bookingProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          child: TabBar(
            labelPadding: const EdgeInsets.all(10),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white.withOpacity(0.6),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: const Color(0xff5e1f20),
            indicatorWeight: 4.0,
            tabs: [
              Tab(
                icon: const Icon(Icons.directions_boat),
                child: Text('Cruise',
                    style: TextStyle(
                        fontSize: Responsive(context).inchp(7) * 0.2)),
              ),
              Tab(
                icon: const Icon(Icons.monochrome_photos),
                child: Text('Gallery',
                    style: TextStyle(
                        fontSize: Responsive(context).inchp(7) * 0.2)),
              ),
              Tab(
                icon: const Icon(Icons.construction),
                child: Text('Boat Spec.',
                    style: TextStyle(
                        fontSize: Responsive(context).inchp(7) * 0.2)),
              ),
              Tab(
                icon: const Icon(Icons.menu_book),
                child: Text('Manual',
                    style: TextStyle(
                        fontSize: Responsive(context).inchp(7) * 0.2)),
              ),
            ],
          ),
        ),
        authenticated == true
            ? _TabBarViewBoat(
                bookingProv: bookingProv,
              )
            : const NoAuthenticatedBoat(),
      ],
    );
  }
}

class _TabBarViewBoat extends StatelessWidget {
  const _TabBarViewBoat({
    required this.bookingProv,
  });
  final BookingState bookingProv;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550, //height of TabBarView
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey, width: 0.5))),
      child: TabBarView(children: <Widget>[
        TabBarViewCruise(bookingProv: bookingProv),
        TabBarViewGallery(bookingProv: bookingProv),
        TabBarViewBoatSpec(bookingProv: bookingProv),
        TabBarViewManual(bookingProv: bookingProv),
      ]),
    );
  }
}
