class Main {
  double? temp;
  double? feelslike;
  double? tempmin;
  double? tempmax;
  int? pressure;
  int? humidity;
  int? sealevel;
  int? grndlevel;

  Main(
      {this.temp,
      this.feelslike,
      this.tempmin,
      this.tempmax,
      this.pressure,
      this.humidity,
      this.sealevel,
      this.grndlevel});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelslike = json['feels_like'];
    tempmin = json['temp_min'];
    tempmax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
    sealevel = json['sea_level'];
    grndlevel = json['grnd_level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;
    data['feels_like'] = feelslike;
    data['temp_min'] = tempmin;
    data['temp_max'] = tempmax;
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    data['sea_level'] = sealevel;
    data['grnd_level'] = grndlevel;
    return data;
  }
}
