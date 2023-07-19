class Rain {
  dynamic h;

  Rain({this.h});

  Rain.fromJson(Map<String, dynamic> json) {
    h = json['3h'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['3h'] = h;
    return data;
  }
}
