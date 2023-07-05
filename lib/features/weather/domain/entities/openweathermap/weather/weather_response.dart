/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
import 'clouds.dart';
import 'coord.dart';
import 'main.dart';
import 'rain.dart';
import 'sys.dart';
import 'weather.dart';
import 'wind.dart';

class WeatherResponse {
  final Coord coord;
  final List<Weather> weather;
  final String base;
  final Main main;
  final int visibility;
  final Wind wind;
  final Rain? rain;
  final Clouds clouds;
  final int dt;
  final Sys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  WeatherResponse(
      {required this.coord,
      required this.weather,
      required this.base,
      required this.main,
      required this.visibility,
      required this.wind,
      this.rain,
      required this.clouds,
      required this.dt,
      required this.sys,
      required this.timezone,
      required this.id,
      required this.name,
      required this.cod});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return WeatherResponse(
        coord: Coord.fromJson(json['coord']),
        weather: Weather.parseQuestions(json['weather']),
        base: json['base'],
        main: Main.fromJson(json['main']),
        visibility: json['visibility'],
        wind: Wind.fromJson(json['wind']),
        rain: json['rain'] != null ? Rain.fromJson(json['rain']) : null,
        clouds: Clouds.fromJson(json['clouds']),
        dt: json['dt'],
        sys: Sys.fromJson(json['sys']),
        timezone: json['timezone'],
        id: json['id'],
        name: json['name'],
        cod: json['cod']);
  }
  static WeatherResponse empty() {
    return WeatherResponse(
        coord: Coord(),
        weather: Weather.listEmpty(),
        base: '',
        main: Main(),
        visibility: 0,
        wind: Wind(),
        rain: Rain(h: 0),
        clouds: Clouds(),
        dt: 0,
        sys: Sys(),
        timezone: 0,
        id: 0,
        name: '',
        cod: 0);
  }
}
