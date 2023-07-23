/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/

import 'package:galapagos_trip_app/features/weather/domain/entities/openweathermap/forecast/list.dart';
import 'city.dart';

class ForecastResponse {
  String? cod;
  int? message;
  int? cnt;
  final List<Lista> list;
  City? city;

  ForecastResponse(
      {this.cod, this.message, this.cnt, required this.list, this.city});

  factory ForecastResponse.fromJson(Map<String, dynamic> json) {
    return ForecastResponse(
        cod: json['cod'],
        message: json['message'],
        cnt: json['cnt'],
        list: json['list'] != null
            ? Lista.parseLista(json['list'])
            : Lista.listEmpty(),
        city: json['city'] != null ? City?.fromJson(json['city']) : null);
  }

  static ForecastResponse empty() {
    return ForecastResponse(
        cod: '',
        message: 0,
        cnt: 0,
        list: Lista.listEmpty(),
        city: City.empty());
  }
}
