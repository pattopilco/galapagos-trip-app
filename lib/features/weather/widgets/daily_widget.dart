import 'package:flutter/material.dart';

import '../../../config/helpers/utils.dart';

class DailyWidget extends StatelessWidget {
  final weather;
  final time;
  final hours;

  const DailyWidget({super.key, this.time, this.hours, this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: Material(
        elevation: 5,
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                hours,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              Text(
                '${weather.dailyTemp.toStringAsFixed(1)}°',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: 16.0),
              MapString.mapStringToIcon(weather.condition, 25),
            ],
          ),
        ),
      ),
    );
  }
}
