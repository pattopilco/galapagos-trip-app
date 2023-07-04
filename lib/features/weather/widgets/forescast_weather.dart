import 'package:flutter/material.dart';
import 'package:galapagos_trip_app/features/weather/domain/entities/forecast/forecast_response.dart';
import 'package:galapagos_trip_app/features/weather/widgets/weather_item_widget.dart';

import '../domain/entities/forecast/list.dart';

class ForescastWeather extends StatelessWidget {
  final ForecastResponse forecast;
  const ForescastWeather({super.key, required this.forecast});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Card(
        elevation: 10.0,
        //color: Color(0xff293643),
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SafeArea(
            top: false,
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 270.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: _getItems(forecast.list),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

List<Widget> _getItems(List<Lista?>? lista) {
  if (lista != null) {
    print(lista.length.toString());
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
