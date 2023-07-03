import 'package:galapagos_trip_app/features/weather/domain/datasources/openweathermap_datasource.dart';
import 'package:galapagos_trip_app/features/weather/domain/entities/forecast/forecast_response.dart';

import 'package:galapagos_trip_app/features/weather/domain/entities/weather/weather_response.dart';
import 'package:galapagos_trip_app/features/weather/domain/infraestructure/datasources/openweathermap_datasource_imp.dart';

import '../../repositories/openweathermap_repository.dart';

class OpenweathermapRepositoryImpl extends OpenweathermapRepository {
  final OpenweathermapDatasource openweathermapDatasource;

  OpenweathermapRepositoryImpl(
      {OpenweathermapDatasource? openweathermapDatasource})
      : openweathermapDatasource =
            openweathermapDatasource ?? OpenweathermapDatasourceImpl();

  @override
  Future<ForecastResponse> getForecast(String lat, String long) {
    return openweathermapDatasource.getForecast(lat, long);
  }

  @override
  Future<WeatherResponse> getWeather(String lat, String long) {
    return openweathermapDatasource.getWeather(lat, long);
  }
}
