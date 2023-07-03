import 'package:galapagos_trip_app/features/weather/domain/entities/forecast/forecast_response.dart';
import 'package:galapagos_trip_app/features/weather/domain/entities/weather/weather_response.dart';

class OwmIsla {
  final WeatherResponse weather;
  final ForecastResponse forecast;
  OwmIsla({required this.weather, required this.forecast});
}
