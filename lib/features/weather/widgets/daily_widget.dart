import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/features/weather/domain/entities/openweathermap/daily_weather.dart';
import 'package:galapagos_trip_app/features/weather/presentation/providers/daily_provider.dart';

import '../../../config/helpers/utils.dart';
import '../presentation/providers/isla_providers.dart';

class DailyWidget extends ConsumerWidget {
  final DailyWeather weather;

  const DailyWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dailyNotifier = ref.watch(dailyProvider.notifier);
    final owmProv = ref.watch(owmProvider);
    return GestureDetector(
      onTap: () {
        dailyNotifier.findListForescastForDay(
            owmProv.forecast.list, weather.date);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 15.0),
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
            Text(
                '${weather.dailyTemp}°C\n${Farenheith.convert(weather.dailyTemp)}°F',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
