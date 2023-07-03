import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class WeatherInfo extends StatelessWidget {
  final String precip;
  final String uvi;

  const WeatherInfo({super.key, required this.precip, required this.uvi});

  Widget _weatherInfoBuilder({
    required String header,
    required String body,
    required IconData icon,
    double? iconSize,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Colors.blue,
          size: iconSize ?? 30,
        ),
        const SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Text(
                header,
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
            ),
            FittedBox(
              child: Text(
                body,
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
              ),
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _weatherInfoBuilder(
              header: 'Precipitation',
              body: precip,
              icon: MdiIcons.weatherRainy,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              height: 65.0,
              child: const VerticalDivider(
                color: Colors.black,
                indent: 10.0,
                endIndent: 10.0,
              ),
            ),
            _weatherInfoBuilder(
              header: 'UV Index',
              body: uvi,
              icon: MdiIcons.sunWireless,
            ),
          ],
        ),
      ),
    );
  }
}
