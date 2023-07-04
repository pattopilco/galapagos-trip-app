import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/features/weather/domain/entities/weather_information.dart';

import '../../domain/infraestructure/repositories/weather_repository_impl.dart';
import '../../domain/repositories/weather_repository.dart';

final weatherInformationProvider =
    StateNotifierProvider<WeatherInformationNotifier, WeatherInformationState>(
        (ref) {
  final repository = WeatherRepositoryImpl();
  final WeatherInformation weatherInformationEmpty = WeatherInformation.init();
  return WeatherInformationNotifier(
      repository: repository, weatherInformation: weatherInformationEmpty);
});

class WeatherInformationNotifier
    extends StateNotifier<WeatherInformationState> {
  final WeatherRepository repository;
  final WeatherInformation weatherInformation;
  WeatherInformationNotifier(
      {required this.weatherInformation, required this.repository})
      : super(WeatherInformationState(weatherInformation: weatherInformation));

  Future<List<WeatherInformation>> getAllWeatherInformation() async {
    final beforeInformationList = await repository.getAll();
    return beforeInformationList;
  }

  Future<void> selectWeatherInformation(int id) async {
    late List<WeatherInformation> listWeatherInformation = [];
    final lista = await repository.getAll();
    listWeatherInformation =
        lista.where((element) => element.id == id).toList();
    state = state.copyWith(
        index: id, weatherInformation: listWeatherInformation[0]);
  }
}

// 3.Estado Menu
class WeatherInformationState {
  final int? index;
  final WeatherInformation weatherInformation;
  WeatherInformationState({this.index, required this.weatherInformation});
  WeatherInformationState copyWith({int? index, required weatherInformation}) =>
      WeatherInformationState(
          index: index, weatherInformation: weatherInformation);
}
