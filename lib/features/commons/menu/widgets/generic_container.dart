import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/features/commons/menu/widgets/generic_app_bar.dart';
import '../../../../config/helpers/images_network_service.dart';
import '../../../trip/presentation/providers/booking_provider.dart';
import 'drawer_container_menu.dart';

class GenericContainer extends ConsumerWidget {
  final Widget body;
  const GenericContainer({super.key, required this.body});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingProv = ref.watch(bookingProvider);
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: CustomScrollView(
          slivers: <Widget>[
            GenericAppBar(
              title: bookingProv.boat.name.toUpperCase(),
              image: ImagesNetworkService.buildImageLocalStorage(
                  '${bookingProv.pathLocalStorage}boatImage.jpg'),
            ),
            SliverToBoxAdapter(
              child: body,
            )
          ],
        ),
      ),
      drawer: const DrawerContainerMenu(),
    );
  }
}
