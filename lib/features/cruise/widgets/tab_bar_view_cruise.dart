import 'package:flutter/material.dart';

import '../../../config/helpers/responsive.dart';
import '../../trip/presentation/providers/booking_provider.dart';

class TabBarViewCruise extends StatelessWidget {
  const TabBarViewCruise({
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
          return SizedBox(
            child: Column(
              children: <Widget>[
                Center(
                  child: Text(
                    bookingProv.boat.name,
                    style: TextStyle(
                        color: const Color(0xff5e1f20),
                        fontSize: Responsive(context).inchp(12) * 0.2),
                    softWrap: false,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis, //
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        bookingProv.boat.categoryII,
                        style: TextStyle(
                            color: const Color(0xFFFFA506),
                            fontWeight: FontWeight.w300,
                            fontSize: Responsive(context).inchp(11) * 0.2),
                      ),
                      Text(
                        bookingProv.boat.type,
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w400,
                            fontSize: Responsive(context).inchp(10) * 0.2),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    bookingProv.boat.description,
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.ltr,
                    style:
                        TextStyle(fontSize: Responsive(context).inchp(8) * 0.2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: buildFeatures(context, bookingProv),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<Widget> buildFeatures(BuildContext context, BookingState bookingProv) {
    List<Widget> widgetList = [];
    if (bookingProv.boat.keyFeatures != null) {
      bookingProv.boat.keyFeatures.asMap().forEach((index, elemento) {
        widgetList.add(Column(
          children: <Widget>[
            Row(children: <Widget>[
              Icon(
                Icons.check,
                color: Theme.of(context).colorScheme.primary,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  elemento,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w300,
                      fontSize: Responsive(context).inchp(8) * 0.2),
                ),
              )),
            ]),
          ],
        ));
      });
    } else {
      widgetList.add(Container());
    }
    return widgetList;
  }
}
