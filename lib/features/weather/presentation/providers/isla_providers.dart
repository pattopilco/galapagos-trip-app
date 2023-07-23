import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/features/weather/domain/entities/openweathermap/daily_weather.dart';
import 'package:galapagos_trip_app/features/weather/domain/entities/openweathermap/forecast/forecast_response.dart';
import 'package:galapagos_trip_app/features/weather/domain/entities/openweathermap/weather/weather_response.dart';
import 'package:galapagos_trip_app/features/weather/domain/infraestructure/repositories/openweathermap_repository_impl.dart';
import 'package:galapagos_trip_app/features/weather/presentation/providers/daily_provider.dart';
import '../../../../config/helpers/utils.dart';
import '../../domain/entities/owm_isla.dart';
import '../../domain/repositories/openweathermap_repository.dart';

// Provider
final filteredIslaProvider = Provider<OwmIsla>((ref) {
  final selectedFilter = ref.watch(islaFilterProvider);
  final ownProv = ref.watch(owmProvider);
  final ownNot = ref.watch(owmProvider.notifier);
  final dailyNot = ref.read(dailyProvider.notifier);

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
  //.then((value) {
  //  dailyNot.findListForescastForDay(
  //      ownProv.forecast.list, DateTime.parse(ownProv.forecast.list[0].dttxt));
  //});

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
      : super(OwmState(
          weather: weather,
          forecast: forecast,
        ));

  Future<void> findWeatherForecast(String lat, String long) async {
    WeatherResponse weather = await owmRepository.getWeather(lat, long);
    ForecastResponse forecast = await owmRepository.getForecast(lat, long);
    state = state.copyWith(weather: weather, forecast: forecast);
  }

  // Obtener los 5 dias
  List<DailyWeather> getDailyWeather(ForecastResponse forecast) {
    List<DailyWeather> listaDaily = forecast.list
        .map((item) => DailyWeather(
            dt: item.dt,
            date: DateTime.parse(item.dttxt),
            day: DateFormated.validateDateNull(item.dttxt.toString()),
            hour: DateFormated.validateHourNull(item.dttxt.toString()),
            condition: item.weather[0].main.toString(),
            dailyTemp: item.main.temp.round().toString()))
        .toList();
    var day = Set<String>();
    List<DailyWeather> uniquelist =
        listaDaily.where((daily) => day.add(daily.day)).toList();
    return uniquelist;
  }
}

/*
  DailyWeather _createDaily(Lista forecast) {
    return DailyWeather(
        dt: forecast.dt,
        day: DateFormated.validateDateNull(forecast.dttxt.toString()),
        hour: DateFormated.validateHourNull(forecast.dttxt.toString()),
        condition: forecast.weather[0].main.toString(),
        dailyTemp: forecast.main.temp.round().toString());
  }
*/

class OwmState {
  final WeatherResponse weather;
  final ForecastResponse forecast;
  OwmState({
    required this.weather,
    required this.forecast,
  });

  OwmState copyWith(
          {required WeatherResponse weather,
          required ForecastResponse forecast}) =>
      OwmState(
        weather: weather,
        forecast: forecast,
      );
}
