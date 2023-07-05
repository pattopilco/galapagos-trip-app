class Rain {
  final double h;

  Rain({required this.h});

  factory Rain.fromJson(Map<String, dynamic> json) {
    return Rain(h: json['1h']);
  }
}
