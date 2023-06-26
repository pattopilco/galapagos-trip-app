import 'package:flutter/material.dart';

import '../../../config/helpers/responsive.dart';
import '../../trip/presentation/providers/booking_provider.dart';

class TabBarViewBoatSpec extends StatelessWidget {
  const TabBarViewBoatSpec({
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
          return Card(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20.0),
                Center(
                  child: Text('${bookingProv.boat.name} Specifications',
                      style: TextStyle(
                          color: const Color(0xff5e1f20),
                          fontSize: Responsive(context).inchp(12) * 0.2)),
                ),
                const SizedBox(height: 20.0),
                DataTable(
                  columns: const [
                    DataColumn(label: Text(' ')),
                    DataColumn(label: Text(' ')),
                  ],
                  headingRowHeight: 0,
                  rows: [
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(SizedBox(
                          width: 200,
                          child: Text(
                            'YEAR OF CONSTRUCTION',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        )),
                        DataCell(Text(
                          bookingProv.boat.year.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text('TYPE')),
                        DataCell(Text(
                          bookingProv.boat.type,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'LENGTH',
                          style: TextStyle(fontSize: 16),
                        )),
                        DataCell(Text(
                          bookingProv.boat.length,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'BEAM',
                          style: TextStyle(fontSize: 16),
                        )),
                        DataCell(Text(
                          bookingProv.boat.beam,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'DRAFT',
                          style: TextStyle(fontSize: 16),
                        )),
                        DataCell(Text(
                          bookingProv.boat.draft,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text(
                          'SPEED',
                          style: TextStyle(fontSize: 16),
                        )),
                        DataCell(Text(
                          bookingProv.boat.speed,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text('CAPACITY')),
                        DataCell(Text(
                          '${bookingProv.boat.passengers} passengers',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
