import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/features/weather/domain/entities/openweathermap/forecast/forecast_response.dart';
import 'package:galapagos_trip_app/features/weather/widgets/weather_item_widget.dart';
import '../domain/entities/openweathermap/forecast/list.dart';
import '../presentation/providers/daily_provider.dart';

class ForescastWeather extends ConsumerWidget {
  final ForecastResponse forecast;
  const ForescastWeather({
    required this.forecast,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dailyProv = ref.watch(dailyProvider);
    return SizedBox(
      width: double.infinity,
      height: 185,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SafeArea(
          top: false,
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: SizedBox(
              height: 180.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _getItems(dailyProv.listForescastDay.isEmpty
                    ? forecast.list
                    : dailyProv.listForescastDay),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

List<Widget> _getItems(List<Lista?>? lista) {
  if (lista != null) {
    return lista.map((item) {
      return WeatherItem(
        dataText: item!.dttxt.toString(),
        description: item.weather[0].description.toString(),
        temperature: item.main.temp!.round().toString(),
        weatherMain: item.weather[0].main.toString(),
      );
    }).toList();
  } else {
    return List.empty();
  }
}
