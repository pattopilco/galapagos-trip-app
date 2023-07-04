import 'package:galapagos_trip_app/features/weather/domain/entities/weather_information.dart';

abstract class WeatherDatasource {
  Future<List<WeatherInformation>> getAll();
}
