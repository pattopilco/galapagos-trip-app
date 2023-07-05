import 'package:dio/dio.dart';
import 'package:galapagos_trip_app/features/weather/domain/datasources/openweathermap_datasource.dart';
import 'package:galapagos_trip_app/features/weather/domain/entities/openweathermap/forecast/forecast_response.dart';
import 'package:galapagos_trip_app/features/weather/domain/entities/openweathermap/weather/weather_response.dart';

import '../../../../../config/constants/environment.dart';

class OpenweathermapDatasourceImpl implements OpenweathermapDatasource {
  final dio = Dio(BaseOptions(baseUrl: Environment.owmUrl));
  final apiKey = Environment.owmKey;

  @override
  Future<WeatherResponse> getWeather(String lat, String long) async {
    final response =
        await dio.get('/weather?lat=$lat&lon=$long&units=metric&appid=$apiKey');
    WeatherResponse weatherResponse = WeatherResponse.fromJson(response.data);
    return weatherResponse;
  }

  @override
  Future<ForecastResponse> getForecast(String lat, String long) async {
    final response = await dio
        .get('/forecast?lat=$lat&lon=$long&units=metric&appid=$apiKey');

    ForecastResponse forecastResponse =
        ForecastResponse.fromJson(response.data);
    return forecastResponse;
  }
}
