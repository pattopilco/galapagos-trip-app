import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/features/weather/domain/entities/information/weather_information.dart';

import '../../domain/infraestructure/repositories/weather_repository_impl.dart';

final listWeatherInformationProvider =
    FutureProvider<List<WeatherInformation>>((ref) async {
  final listWeatherInformation = await WeatherRepositoryImpl().getAll();
  return listWeatherInformation;
});
