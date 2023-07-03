import 'package:galapagos_trip_app/features/weather/domain/entities/weather/weather_response.dart';

import '../entities/forecast/forecast_response.dart';

abstract class OpenweathermapRepository {
  Future<WeatherResponse> getWeather(String lat, String long);
  Future<ForecastResponse> getForecast(String lat, String long);
}
