import 'package:galapagos_trip_app/features/weather/domain/entities/information/weather_description.dart';

class WeatherInformation {
  final int id;
  final String itemTitle;
  final List<WeatherDescription> description;

  WeatherInformation(
      {required this.id, required this.itemTitle, required this.description});

  static WeatherInformation empty() {
    return WeatherInformation(id: -1, itemTitle: '', description: List.empty());
  }

  static WeatherInformation init() {
    return WeatherInformation(
        id: 0,
        itemTitle: 'Description',
        description: WeatherDescription.listInit());
  }

  static List<WeatherInformation> parseWeatherDescriptions(
      List<dynamic> listDescription) {
    List<WeatherInformation> empty = [];
    if (listDescription.isEmpty) return empty;
    return listDescription
        .map<WeatherInformation>((json) => WeatherInformation.fromJson(json))
        .toList();
  }

  factory WeatherInformation.fromJson(Map<String, dynamic> json) {
    return WeatherInformation(
        id: json['id'] as int,
        itemTitle: json['itemTitle'],
        description:
            WeatherDescription.parseWeatherDescriptions(json['description']));
  }

  WeatherInformation toitemTitleEntity() => WeatherInformation(
        id: id,
        itemTitle: itemTitle,
        description: description,
      );
}
