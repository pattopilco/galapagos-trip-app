import 'coord.dart';

class City {
  int? id;
  String? name;
  Coord? coord;
  String? country;
  int? population;
  int? timezone;
  int? sunrise;
  int? sunset;

  City(
      {this.id,
      this.name,
      required this.coord,
      this.country,
      this.population,
      this.timezone,
      this.sunrise,
      this.sunset});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord = Coord.fromJson(json['coord']);
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['coord'] = coord!.toJson();
    data['country'] = country;
    data['population'] = population;
    data['timezone'] = timezone;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    return data;
  }

  static City empty() {
    return City(coord: Coord());
  }
}
