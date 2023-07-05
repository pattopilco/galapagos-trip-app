import 'package:flutter/material.dart';
import 'package:galapagos_trip_app/features/weather/domain/entities/openweathermap/daily_weather.dart';

import '../../../config/helpers/utils.dart';

class DailyWidget extends StatelessWidget {
  final DailyWeather weather;

  const DailyWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      child: Column(
        children: [
          FittedBox(
            child: Text(
              weather.day.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MapString.mapStringToIcon('${weather.condition}', 35),
          ),
          Text('${weather.condition}'),
        ],
      ),
    );
  }
}
