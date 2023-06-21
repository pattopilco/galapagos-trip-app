import 'package:flutter/material.dart';
import 'package:galapagos_trip_app/infraestructure/services/util_file_services.dart';

class CustomListItem extends StatelessWidget {
  final String code;
  final String cruise;
  const CustomListItem({
    super.key,
    required this.code,
    required this.cruise,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Expanded(
                flex: 2,
                child: Icon(Icons.directions_boat_filled),
              ),
              Expanded(
                flex: 3,
                child: _CruiseDescription(
                  code: code,
                  cruise: cruise,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ElevatedButton(
                onPressed: () async {
                  await UtilFileService.openDocument('itinerary.pdf');
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Itinerary'),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.download,
                      size: 24.0,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () async {
                  await UtilFileService.openDocument('voucher.pdf');
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Voucher'),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.download,
                      size: 24.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CruiseDescription extends StatelessWidget {
  const _CruiseDescription({
    required this.code,
    required this.cruise,
  });

  final String code;
  final String cruise;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            code,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            cruise,
            style: const TextStyle(fontSize: 10.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
        ],
      ),
    );
  }
}
