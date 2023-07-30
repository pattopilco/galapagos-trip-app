class DailyWeather {
  final int dt;
  final dynamic dailyTemp;
  final DateTime? date;
  final String day;
  final String hour;
  final String? condition;

  DailyWeather(
      {required this.dt,
      this.dailyTemp,
      this.date,
      required this.day,
      required this.hour,
      this.condition});

  Map<String, dynamic> toJson(DailyWeather dailyWeather) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dailyWeather.dt;
    data['dailyTemp'] = dailyWeather.dailyTemp;
    data['date'] = dailyWeather.date;
    data['day'] = dailyWeather.day;
    data['hour'] = dailyWeather.hour;
    data['condition'] = dailyWeather.condition;
    return data;
  }

  static empty() {
    return DailyWeather(dt: 0, day: '', hour: '');
  }

  static List<DailyWeather> listEmpty() {
    List<DailyWeather> list = [];
    return list;
  }
}
