import 'package:galapagos_trip_app/features/weather/domain/entities/information/weather_information.dart';

import '../../datasources/weather_datasource.dart';
import '../../repositories/weather_repository.dart';
import '../datasources/local_weather_ds_impl.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherDatasource weatherDatasource;

  WeatherRepositoryImpl({WeatherDatasource? weatherDatasource})
      : weatherDatasource = weatherDatasource ?? LocalWeatherDatasource();

  @override
  Future<List<WeatherInformation>> getAll() {
    return weatherDatasource.getAll();
  }
}
