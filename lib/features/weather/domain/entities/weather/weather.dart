class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }

  static List<Weather> parseQuestions(List<dynamic> listWeather) {
    List<Weather> empty = [];
    if (listWeather.isEmpty) return empty;
    return listWeather.map<Weather>((json) => Weather.fromJson(json)).toList();
  }

  static List<Weather> listEmpty() {
    final Weather weather = Weather();
    final List<Weather> lista = [];
    lista.add(weather);
    return lista;
  }
}
