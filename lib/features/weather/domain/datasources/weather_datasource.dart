import 'package:galapagos_trip_app/features/weather/domain/entities/information/weather_information.dart';

abstract class WeatherDatasource {
  Future<List<WeatherInformation>> getAll();
}
