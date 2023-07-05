import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/features/weather/domain/entities/openweathermap/daily_weather.dart';
import 'package:galapagos_trip_app/features/weather/domain/entities/openweathermap/forecast/forecast_response.dart';
import 'package:galapagos_trip_app/features/weather/domain/entities/openweathermap/weather/weather_response.dart';
import 'package:galapagos_trip_app/features/weather/domain/infraestructure/repositories/openweathermap_repository_impl.dart';

import '../../../../config/helpers/utils.dart';
import '../../domain/entities/openweathermap/forecast/list.dart';
import '../../domain/entities/owm_isla.dart';
import '../../domain/repositories/openweathermap_repository.dart';

// Provider
final filteredIslaProvider = Provider<OwmIsla>((ref) {
  final selectedFilter = ref.watch(islaFilterProvider);
  final ownProv = ref.watch(owmProvider);
  final ownNot = ref.watch(owmProvider.notifier);

  late String long;
  late String lat;

  if (selectedFilter == IslaFilter.isabela) {
    lat = '-0.8574971389360684';
    long = '-91.27420264107988';
  } else if (selectedFilter == IslaFilter.scristobal) {
    lat = '0.9151';
    long = '-0.8574971389360684';
  } else if (selectedFilter == IslaFilter.scruz) {
    lat = '-0.63333';
    long = '-90.36667';
  }
  ownNot.findWeatherForecast(lat, long);
  return OwmIsla(weather: ownProv.weather, forecast: ownProv.forecast);
});

// StateProvider
enum IslaFilter { scruz, scristobal, isabela }

final islaFilterProvider = StateProvider<IslaFilter>((ref) {
  return IslaFilter.scruz;
});

// StateNotifierProvider

final owmProvider = StateNotifierProvider<OwmNotifier, OwmState>((ref) {
  final repository = OpenweathermapRepositoryImpl();
  return OwmNotifier(
      forecast: ForecastResponse.empty(),
      owmRepository: repository,
      weather: WeatherResponse.empty());
});

class OwmNotifier extends StateNotifier<OwmState> {
  final OpenweathermapRepository owmRepository;
  final WeatherResponse weather;
  final ForecastResponse forecast;
  OwmNotifier(
      {required this.owmRepository,
      required this.weather,
      required this.forecast})
      : super(OwmState(weather: weather, forecast: forecast));

  Future<void> findWeatherForecast(String lat, String long) async {
    print('>>>>>>>>>>>>>>>>>>>>>>>>findWeatherForecast');
    WeatherResponse weather = await owmRepository.getWeather(lat, long);
    ForecastResponse forecast = await owmRepository.getForecast(lat, long);
    state = state.copyWith(weather: weather, forecast: forecast);
  }

  List<DailyWeather> getDailyWeather(ForecastResponse forecast) {
    List<DailyWeather> listaDaily = forecast.list!
        //.map((l) => DailyWeather(date: DateTime.parse(l!.dttxt)))
        .map((lista) => DailyWeather(
            day: DateFormated.validateDateNull(lista!.dttxt.toString())))
        .toList();

    List<dynamic> lista =
        listaDaily.map((lis) => DailyWeather().toJson(lis)).toList();

    return listaDaily;
  }
}

class OwmState {
  final WeatherResponse weather;
  final ForecastResponse forecast;

  OwmState({required this.weather, required this.forecast});

  OwmState copyWith(
          {required WeatherResponse weather,
          required ForecastResponse forecast}) =>
      OwmState(
          weather: weather ?? this.weather,
          forecast: forecast ?? this.forecast);
}
