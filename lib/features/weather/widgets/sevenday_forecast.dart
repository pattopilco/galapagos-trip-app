import 'package:flutter/material.dart';
import 'package:galapagos_trip_app/features/weather/domain/entities/openweathermap/daily_weather.dart';
import 'package:galapagos_trip_app/features/weather/widgets/daily_widget.dart';

class SevenDayForecast extends StatelessWidget {
  final List<DailyWeather> listDailyWeather;
  const SevenDayForecast({super.key, required this.listDailyWeather});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        scrollDirection: Axis.horizontal,
        itemCount: listDailyWeather.length,
        itemBuilder: (context, index) {
          DailyWeather weather = listDailyWeather[index];
          return DailyWidget(
            weather: weather,
          );
        },
      ),
    );
  }
}
