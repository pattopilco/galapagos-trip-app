import 'package:galapagos_trip_app/features/weather/domain/entities/forecast/weather.dart';

import 'clouds.dart';
import 'main.dart';
import 'rain.dart';
import 'sys.dart';
import 'wind.dart';

class Lista {
  final int dt;
  final Main main;
  final List<Weather> weather;
  final Clouds clouds;
  final Wind wind;
  final int visibility;
  final double pop;
  final Rain rain;
  final Sys sys;
  final String dttxt;

  Lista(
      {required this.dt,
      required this.main,
      required this.weather,
      required this.clouds,
      required this.wind,
      required this.visibility,
      required this.pop,
      required this.rain,
      required this.sys,
      required this.dttxt});

  factory Lista.fromJson(Map<String, dynamic> json) {
    return Lista(
        dt: json['dt'],
        main: json['main'],
        weather: json['weather'],
        clouds: json['clouds'],
        wind: json['wind'],
        visibility: json['visibility'],
        pop: json['pop'],
        rain: json['rain'],
        sys: json['sys'],
        dttxt: json['dt_txt']);
  }

  static List<Lista> parseQuestions(List<dynamic> listLista) {
    List<Lista> empty = [];
    if (listLista.isEmpty) return empty;
    return listLista.map<Lista>((json) => Lista.fromJson(json)).toList();
  }

  static List<Lista> listEmpty() {
    final Lista lista = Lista(
        dt: 0,
        main: Main(),
        weather: Weather.listEmpty(),
        clouds: Clouds(),
        wind: Wind(),
        visibility: 0,
        pop: 0,
        rain: Rain(),
        sys: Sys(),
        dttxt: '');
    final List<Lista> listLista = [];
    listLista.add(lista);
    return listLista;
  }
}
