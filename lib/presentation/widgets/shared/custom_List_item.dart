import 'package:flutter/material.dart';
import 'package:galapagos_trip_app/infraestructure/services/util_file_services.dart';
import 'package:go_router/go_router.dart';

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
              Expanded(
                flex: 2,
                child: _CodeTrip(code: code),
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
          const Divider(
            color: Colors.black45,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Documents',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
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
          ])
        ],
      ),
    );
  }
}

class _CodeTrip extends StatelessWidget {
  const _CodeTrip({
    required this.code,
  });

  final String code;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.directions_boat_filled),
        Text(
          code,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
          ),
        ),
      ],
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
          //const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          ElevatedButton(
              style: FilledButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary),
              onPressed: () => context.go('/cruise'),
              child: const Text(
                'Go to my trip',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),

          //const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
        ],
      ),
    );
  }
}
