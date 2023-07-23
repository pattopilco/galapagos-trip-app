import 'package:flutter/material.dart';
import 'package:galapagos_trip_app/features/weather/widgets/weather_item_widget.dart';
import '../domain/entities/openweathermap/forecast/list.dart';

class ForescastWeather extends StatelessWidget {
  final List<Lista> listForecast;
  const ForescastWeather({super.key, required this.listForecast});

  @override
  Widget build(BuildContext context) {
    print('ForescastWeather-listForecast:' + listForecast.length.toString());
    return SizedBox(
      width: double.infinity,
      height: 230,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SafeArea(
          top: false,
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 180.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _getItems(listForecast),
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
        description: item!.weather[0].description.toString(),
        temperature: item.main.temp!.round().toString(),
        weatherMain: item.weather[0].main.toString(),
      );
    }).toList();
  } else {
    return List.empty();
  }
}
