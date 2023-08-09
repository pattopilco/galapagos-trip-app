import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../config/helpers/responsive.dart';
import '../../trip/presentation/providers/booking_provider.dart';
import '../infraestructure/services/cruise_service.dart';

class HeaderBoat extends ConsumerWidget {
  final bool authenticated;
  const HeaderBoat({
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
          height: 160,
          width: double.infinity,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                _HeaderLogo(
                  pathLocalStorage: bookingProv.pathLocalStorage,
                  logo: authenticated == true ? bookingProv.boat.logo : '',
                  categoriaII:
                      authenticated == true ? bookingProv.boat.categoryII : '',
                  authenticated: authenticated,
                ),
                const SizedBox(height: 20),
                _HeaderBoat(
                  authenticated: authenticated,
                  type: authenticated == true ? bookingProv.boat.type : '',
                  passengers: authenticated == true
                      ? bookingProv.boat.passengers.toString()
                      : '',
                ),
                const SizedBox(height: 3.0),
                _HeaderItineraryType(
                  itineraryTypes: bookingProv.boat.itineraryTypes,
                  authenticated: authenticated,
                ),
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
  final bool authenticated;
  final String pathLocalStorage;
  final String logo;
  final String categoriaII;
  const _HeaderLogo(
      {required this.logo,
      required this.categoriaII,
      required this.pathLocalStorage,
      required this.authenticated});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        authenticated == true
            ? Image.file(File('$pathLocalStorage$logo'))
            : Container(
                width: 145,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                ),
              ),
        authenticated == true
            ? Text(
                categoriaII,
                style: TextStyle(
                    color: const Color(0xff5e1f20),
                    fontWeight: FontWeight.w300,
                    fontSize: Responsive(context).inchp(11) * 0.2),
              )
            : Container(
                width: 100,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                ),
              ),
      ],
    );
  }
}

class _HeaderBoat extends StatelessWidget {
  final bool authenticated;
  final String type;
  final String passengers;
  const _HeaderBoat(
      {required this.type,
      required this.passengers,
      required this.authenticated});

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
                authenticated == true
                    ? Text(
                        type,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: Responsive(context).inchp(9) * 0.2),
                      )
                    : Container(
                        width: 100,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                        ),
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
                authenticated == true
                    ? Text(
                        passengers,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: Responsive(context).inchp(9) * 0.2),
                      )
                    : Container(
                        width: 70,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                        ),
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
  final bool authenticated;
  final List<String> itineraryTypes;
  const _HeaderItineraryType(
      {required this.itineraryTypes, required this.authenticated});

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
                authenticated == true
                    ? Text(
                        CruiseService().getListItinerariesFleet(itineraryTypes),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: Responsive(context).inchp(9) * 0.2),
                      )
                    : Container(
                        width: 100,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
