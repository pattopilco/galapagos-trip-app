import 'package:galapagos_trip_app/features/weather/domain/entities/openweathermap/weather/weather_response.dart';

import '../entities/openweathermap/forecast/forecast_response.dart';

abstract class OpenweathermapDatasource {
  Future<WeatherResponse> getWeather(String lat, String long);
  Future<ForecastResponse> getForecast(String lat, String long);
  Future<dynamic> getWeatherResponse(String lat, String long);
  Future<dynamic> getForecastResponse(String lat, String long);
}
