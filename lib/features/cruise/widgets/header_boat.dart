import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/config/helpers/util_file_services.dart';

import '../../../config/helpers/images_network_service.dart';
import '../../../config/helpers/responsive.dart';
import '../../trip/presentation/providers/booking_provider.dart';
import '../infraestructure/services/cruise_service.dart';

class HeaderBoat extends ConsumerWidget {
  const HeaderBoat({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingProv = ref.watch(bookingProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          height: 160,
          width: double.infinity,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                _HeaderLogo(
                    pathLocalStorage: bookingProv.pathLocalStorage,
                    logo: bookingProv.boat.logo,
                    categoriaII: bookingProv.boat.categoryII),
                const SizedBox(height: 20),
                _HeaderBoat(
                  type: bookingProv.boat.type,
                  passengers: bookingProv.boat.passengers.toString(),
                ),
                const SizedBox(height: 3.0),
                _HeaderItineraryType(
                    itineraryTypes: bookingProv.boat.itineraryTypes),
                const Spacer(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _HeaderLogo extends StatelessWidget {
  final String pathLocalStorage;
  final String logo;
  final String categoriaII;
  const _HeaderLogo(
      {required this.logo,
      required this.categoriaII,
      required this.pathLocalStorage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Image.file(File('${pathLocalStorage}boatLogo.jpg')),
        Text(
          categoriaII,
          style: TextStyle(
              color: const Color(0xff5e1f20),
              fontWeight: FontWeight.w300,
              fontSize: Responsive(context).inchp(11) * 0.2),
        ),
      ],
    );
  }
}

class _HeaderBoat extends StatelessWidget {
  final String type;
  final String passengers;
  const _HeaderBoat({required this.type, required this.passengers});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 1),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Icon(
                    Icons.directions_boat,
                    color: Color(0xff5e1f20),
                  ),
                ),
                Text(
                  type,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: Responsive(context).inchp(9) * 0.2),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Icon(
                    Icons.people,
                    color: Color(0xff5e1f20),
                  ),
                ),
                Text(
                  passengers,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: Responsive(context).inchp(9) * 0.2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderItineraryType extends StatelessWidget {
  final List<String> itineraryTypes;
  const _HeaderItineraryType({required this.itineraryTypes});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 1),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Icon(
                    Icons.today,
                    color: Color(0xff5e1f20),
                  ),
                ),
                Text(
                  CruiseService().getListItinerariesFleet(itineraryTypes),
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: Responsive(context).inchp(9) * 0.2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
