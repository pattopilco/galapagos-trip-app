import 'dart:convert';

import 'package:dart_date/dart_date.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/features/weather/domain/entities/openweathermap/daily_weather.dart';
import 'package:galapagos_trip_app/features/weather/domain/entities/openweathermap/forecast/forecast_response.dart';
import 'package:galapagos_trip_app/features/weather/domain/entities/openweathermap/weather/weather_response.dart';
import 'package:galapagos_trip_app/features/weather/domain/infraestructure/repositories/openweathermap_repository_impl.dart';
import '../../../../config/helpers/key_value_storage_service_impl.dart';
import '../../../../config/helpers/utils.dart';
import '../../domain/entities/owm_isla.dart';
import '../../domain/repositories/openweathermap_repository.dart';

// Provider
final filteredIslaProvider = Provider<OwmIsla>((ref) {
  final selectedFilter = ref.watch(islaFilterProvider);
  final ownProv = ref.watch(owmProvider);
  final ownNot = ref.watch(owmProvider.notifier);
  ownNot.findWeatherForecast(selectedFilter);
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
  final WeatherResponse weather = WeatherResponse.empty();
  final ForecastResponse forecast = ForecastResponse.empty();
  return OwmNotifier(
      owmRepository: repository,
      listNextDays: DailyWeather.listEmpty(),
      forecast: forecast,
      weather: weather);
});

class OwmNotifier extends StateNotifier<OwmState> {
  final OpenweathermapRepository owmRepository;
  final WeatherResponse weather;
  final ForecastResponse forecast;
  final List<DailyWeather> listNextDays;

  OwmNotifier(
      {required this.owmRepository,
      required this.weather,
      required this.forecast,
      required this.listNextDays})
      : super(OwmState(
            weather: weather, forecast: forecast, listNextDays: listNextDays));

  Future<void> findWeatherForecast(IslaFilter selectedFilter) async {
    KeyValueStorageServiceImpl keyValueStorageServiceImpl =
        KeyValueStorageServiceImpl();
    if (await keyValueStorageServiceImpl.checkValue('FIND_DATE') == false) {
      await keyValueStorageServiceImpl.setKeyValue<String>(
          'FIND_DATE', DateTime.now().toString());
      //Delelte local storage Islands
      await _removeKeyIsland();
      //get data and save to local storage
      await _saveLocalStorageIsabela();
      await _saveLocalStorageSCristobal();
      await _saveLocalStorageSCruz();
    } else {
      final findDate =
          await keyValueStorageServiceImpl.getValue<String>('FIND_DATE');
      final findDateDateTime = DateTime.parse(findDate.toString());

      //Verifica fecha actual con fecha guadada en localstorage de la ulitma consulta
      if (DateTime.now()
          .isSameDay(DateTime.parse(findDateDateTime.toString()))) {
      } else {
        //Delete local storage Islands
        await keyValueStorageServiceImpl.removeKey('FIND_DATE');
        await _removeKeyIsland();
        //Update date FIND_DATE
        await keyValueStorageServiceImpl.setKeyValue<String>(
            'FIND_DATE', DateTime.now().toString());
        //get data and save to local storage
        await _saveLocalStorageIsabela();
        await _saveLocalStorageSCristobal();
        await _saveLocalStorageSCruz();
      }
    }
    _generateWeatherForescast(selectedFilter);
  }

  Future<void> _generateWeatherForescast(IslaFilter selectedFilter) async {
    KeyValueStorageServiceImpl keyValueStorageServiceImpl =
        KeyValueStorageServiceImpl();
    late dynamic weatherIsabellaJson;
    late dynamic forecastIsabellaJson;
    late dynamic weatherSCristobalJson;
    late dynamic forecastSCristobalJson;
    late dynamic weatherSCruzJson;
    late dynamic forecastSCruzJson;
    late WeatherResponse weather = WeatherResponse.empty();
    late ForecastResponse forecast = ForecastResponse.empty();
    if (selectedFilter == IslaFilter.isabela) {
      if (await keyValueStorageServiceImpl.checkValue('WEATHER_ISABELLA')) {
        weatherIsabellaJson = await keyValueStorageServiceImpl
            .getValue<String>('WEATHER_ISABELLA');
        weather = WeatherResponse.fromJson(
            jsonDecode(weatherIsabellaJson.toString()));
      }
      if (await keyValueStorageServiceImpl.checkValue('FORESCAST_ISABELLA')) {
        forecastIsabellaJson = await keyValueStorageServiceImpl
            .getValue<String>('FORESCAST_ISABELLA');
        forecast = ForecastResponse.fromJson(
            jsonDecode(forecastIsabellaJson.toString()));
      }
    } else if (selectedFilter == IslaFilter.scristobal) {
      if (await keyValueStorageServiceImpl.checkValue('WEATHER_SCRISTOBAL')) {
        weatherSCristobalJson = await keyValueStorageServiceImpl
            .getValue<String>('WEATHER_SCRISTOBAL');
        weather = WeatherResponse.fromJson(
            jsonDecode(weatherSCristobalJson.toString()));
      }

      if (await keyValueStorageServiceImpl.checkValue('FORESCAST_SCRISTOBAL')) {
        forecastSCristobalJson = await keyValueStorageServiceImpl
            .getValue<String>('FORESCAST_SCRISTOBAL');
        forecast = ForecastResponse.fromJson(
            jsonDecode(forecastSCristobalJson.toString()));
      }
    } else if (selectedFilter == IslaFilter.scruz) {
      if (await keyValueStorageServiceImpl.checkValue('WEATHER_SCRUZ')) {
        weatherSCruzJson =
            await keyValueStorageServiceImpl.getValue<String>('WEATHER_SCRUZ');
        weather =
            WeatherResponse.fromJson(jsonDecode(weatherSCruzJson.toString()));
      }
      if (await keyValueStorageServiceImpl.checkValue('FORESCAST_SCRUZ')) {
        forecastSCruzJson = await keyValueStorageServiceImpl
            .getValue<String>('FORESCAST_SCRUZ');
        forecast =
            ForecastResponse.fromJson(jsonDecode(forecastSCruzJson.toString()));
      }
    }
    List<DailyWeather> listNextDays = _getDailyWeather(forecast);
    state = state.copyWith(
        weather: weather, forecast: forecast, listNextDays: listNextDays);
  }

  Future<void> _removeKeyIsland() async {
    KeyValueStorageServiceImpl keyValueStorageServiceImpl =
        KeyValueStorageServiceImpl();
    await keyValueStorageServiceImpl.removeKey('WEATHER_ISABELLA');
    await keyValueStorageServiceImpl.removeKey('FORESCAST_ISABELLA');
    await keyValueStorageServiceImpl.removeKey('WEATHER_SCRISTOBAL');
    await keyValueStorageServiceImpl.removeKey('FORESCAST_SCRISTOBAL');
    await keyValueStorageServiceImpl.removeKey('WEATHER_SCRUZ');
    await keyValueStorageServiceImpl.removeKey('FORESCAST_SCRUZ');
  }

  Future<void> _saveLocalStorageSCristobal() async {
    KeyValueStorageServiceImpl keyValueStorageServiceImpl =
        KeyValueStorageServiceImpl();
    String lat = '0.9151';
    String long = '-0.8574971389360684';
    final weatherSCristobalJson =
        await owmRepository.getWeatherResponse(lat, long);
    await keyValueStorageServiceImpl.setKeyValue<String>(
        'WEATHER_SCRISTOBAL', jsonEncode(weatherSCristobalJson));
    final forecastSCristobalJson =
        await owmRepository.getForescastResponse(lat, long);
    await keyValueStorageServiceImpl.setKeyValue<String>(
        'FORESCAST_SCRISTOBAL', jsonEncode(forecastSCristobalJson));
  }

  Future<void> _saveLocalStorageIsabela() async {
    KeyValueStorageServiceImpl keyValueStorageServiceImpl =
        KeyValueStorageServiceImpl();

    String lat = '-0.8574971389360684';
    String long = '-91.27420264107988';
    final weatherIsabellaJson =
        await owmRepository.getWeatherResponse(lat, long);
    await keyValueStorageServiceImpl.setKeyValue<String>(
        'WEATHER_ISABELLA', jsonEncode(weatherIsabellaJson));
    final forecastIsabellaJson =
        await owmRepository.getForescastResponse(lat, long);
    await keyValueStorageServiceImpl.setKeyValue<String>(
        'FORESCAST_ISABELLA', jsonEncode(forecastIsabellaJson));
  }

  Future<void> _saveLocalStorageSCruz() async {
    KeyValueStorageServiceImpl keyValueStorageServiceImpl =
        KeyValueStorageServiceImpl();
    String lat = '-0.63333';
    String long = '-90.36667';
    final weatherSCruzJson = await owmRepository.getWeatherResponse(lat, long);
    await keyValueStorageServiceImpl.setKeyValue<String>(
        'WEATHER_SCRUZ', jsonEncode(weatherSCruzJson));
    final forecastSCruzJson =
        await owmRepository.getForescastResponse(lat, long);
    await keyValueStorageServiceImpl.setKeyValue<String>(
        'FORESCAST_SCRUZ', jsonEncode(forecastSCruzJson));
  }

  // Obtener los 5 dias
  List<DailyWeather> _getDailyWeather(ForecastResponse forecast) {
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

class OwmState {
  final WeatherResponse weather;
  final ForecastResponse forecast;
  final List<DailyWeather> listNextDays;
  //final List<Lista> listForescastDay;
  OwmState({
    required this.weather,
    required this.forecast,
    required this.listNextDays,
  });
  //required this.listForescastDay});

  OwmState copyWith({
    required WeatherResponse weather,
    required ForecastResponse forecast,
    required List<DailyWeather> listNextDays,
    //required List<Lista> listForescastDay,
  }) =>
      OwmState(
        weather: weather,
        forecast: forecast,
        listNextDays: listNextDays,
        //listForescastDay: listForescastDay,
      );
}
