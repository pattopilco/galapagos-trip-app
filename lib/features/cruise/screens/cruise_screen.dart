import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/features/trip/presentation/providers/booking_provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/helpers/images_network_service.dart';
import '../../../config/helpers/responsive.dart';
import '../../../presentation/widgets/commons/generic_container_menu.dart';
import '../widgets/header_boat.dart';
import '../widgets/tab_bar_boat.dart';

class CruiseScreen extends ConsumerWidget {
  const CruiseScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingProv = ref.watch(bookingProvider);

    return GenericContainerMenu(
      body: Container(
        color: Colors.black,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverBoatImage(bookingProv: bookingProv),
            SliverToBoxAdapter(
              child: Container(
                color: Theme.of(context).colorScheme.primary,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    HeaderBoat(),
                    DefaultTabController(
                      length: 4,
                      initialIndex: 0,
                      child: TabBarBoat(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SliverBoatImage extends StatelessWidget {
  const SliverBoatImage({
    super.key,
    required this.bookingProv,
  });
  final BookingState bookingProv;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      expandedHeight: Responsive(context).widthp(95) * .5,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          bookingProv.boat.name.toUpperCase(),
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(color: Colors.white, letterSpacing: .5),
          ),
        ),
        centerTitle: true,
        collapseMode: CollapseMode.parallax,
        background: Container(
          constraints: const BoxConstraints.expand(height: 1000),
          child: ImagesNetworkService.buildImage(
              'https://galavail.com/upload/fleet/', bookingProv.boat.image),
        ),
      ),
    );
  }
}
