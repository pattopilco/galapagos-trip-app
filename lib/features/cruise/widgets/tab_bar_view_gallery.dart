import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:galapagos_trip_app/config/helpers/images_network_service.dart';

import '../../../config/helpers/responsive.dart';
import '../../trip/presentation/providers/booking_provider.dart';

class TabBarViewGallery extends StatelessWidget {
  const TabBarViewGallery({
    super.key,
    required this.bookingProv,
  });
  final BookingState bookingProv;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              const SizedBox(height: 20.0),
              Center(
                child: Text('${bookingProv.boat.name} Gallery',
                    style: TextStyle(
                        color: const Color(0xff5e1f20),
                        fontSize: Responsive(context).inchp(12) * 0.2)),
              ),
              const SizedBox(height: 10.0),
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                items: ImagesNetworkService.buildImagesLabel(
                    bookingProv.boat.imagesBoat),
              ),
            ],
          );
        },
      ),
    );
  }
}
