import 'package:flutter/material.dart';

import '../../../config/helpers/responsive.dart';
import '../../../config/helpers/util_file_services.dart';
import '../../trip/presentation/providers/booking_provider.dart';

class TabBarViewManual extends StatelessWidget {
  const TabBarViewManual({
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
                children: [
                  Center(
                    child: Text('${bookingProv.boat.name} Manuals',
                        style: TextStyle(
                            color: const Color(0xff5e1f20),
                            fontSize: Responsive(context).inchp(12) * 0.2)),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child:
                                          Icon(Icons.picture_as_pdf_outlined),
                                    ),
                                    Text(
                                      "Cabin Manual",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24.0,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                  onPressed: () async {
                                    await UtilFileService.openDocument(
                                        '${bookingProv.boat.name}.pdf');
                                  },
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Download Document',
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
                              ],
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
