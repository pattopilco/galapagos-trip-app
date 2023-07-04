import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:galapagos_trip_app/features/weather/domain/entities/weather_information.dart';

import '../../datasources/weather_datasource.dart';

class LocalWeatherDatasource implements WeatherDatasource {
  final String _data = 'assets/data/local_weather_information.json';

  @override
  Future<List<WeatherInformation>> getAll() async {
    final result = await _getWeatherInformation();
    final List<WeatherInformation> resultList = result
        .map<WeatherInformation>((json) => WeatherInformation.fromJson(json))
        .toList();
    return resultList;
  }

  Future<dynamic> _getWeatherInformation() async {
    final result = await rootBundle.loadString(_data);
    return jsonDecode(result);
  }
}
