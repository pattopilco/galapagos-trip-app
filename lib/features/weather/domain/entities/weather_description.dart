class WeatherDescription {
  final String subtitle;
  final String textContent;
  final String imageTitle;

  WeatherDescription(
      {required this.subtitle,
      required this.textContent,
      required this.imageTitle});

  WeatherDescription empty() {
    return WeatherDescription(subtitle: '', textContent: '', imageTitle: '');
  }

  static WeatherDescription init() {
    return WeatherDescription(subtitle: '', textContent: '', imageTitle: '');
  }

  static List<WeatherDescription> listInit() {
    final List<WeatherDescription> list = [];
    list.add(WeatherDescription.init());
    return list;
  }

  static List<WeatherDescription> parseWeatherDescriptions(
      List<dynamic> listWeatherDescription) {
    List<WeatherDescription> empty = [];
    if (listWeatherDescription.isEmpty) return empty;
    return listWeatherDescription
        .map<WeatherDescription>((json) => WeatherDescription.fromJson(json))
        .toList();
  }

  factory WeatherDescription.fromJson(Map<String, dynamic> json) {
    return WeatherDescription(
        subtitle: json['subtitle'],
        textContent: json['textContent'],
        imageTitle: json['imageTitle']);
  }
}
