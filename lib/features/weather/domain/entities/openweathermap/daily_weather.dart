class DailyWeather {
  final dynamic dailyTemp;
  final DateTime? date;
  final String day;
  final String hour;
  final String? condition;

  DailyWeather(
      {this.dailyTemp,
      this.date,
      required this.day,
      required this.hour,
      this.condition});

  Map<String, dynamic> toJson(DailyWeather dailyWeather) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dailyTemp'] = dailyWeather.dailyTemp;
    data['date'] = dailyWeather.date;
    data['day'] = dailyWeather.day;
    data['hour'] = dailyWeather.hour;
    data['condition'] = dailyWeather.condition;
    return data;
  }
}
