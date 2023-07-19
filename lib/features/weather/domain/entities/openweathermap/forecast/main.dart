class Main {
  dynamic temp;
  dynamic feelslike;
  dynamic tempmin;
  dynamic tempmax;
  int? pressure;
  int? sealevel;
  int? grndlevel;
  int? humidity;
  dynamic tempkf;

  Main(
      {this.temp,
      this.feelslike,
      this.tempmin,
      this.tempmax,
      this.pressure,
      this.sealevel,
      this.grndlevel,
      this.humidity,
      this.tempkf});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelslike = json['feels_like'];
    tempmin = json['temp_min'];
    tempmax = json['temp_max'];
    pressure = json['pressure'];
    sealevel = json['sea_level'];
    grndlevel = json['grnd_level'];
    humidity = json['humidity'];
    tempkf = json['temp_kf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;
    data['feels_like'] = feelslike;
    data['temp_min'] = tempmin;
    data['temp_max'] = tempmax;
    data['pressure'] = pressure;
    data['sea_level'] = sealevel;
    data['grnd_level'] = grndlevel;
    data['humidity'] = humidity;
    data['temp_kf'] = tempkf;
    return data;
  }
}
