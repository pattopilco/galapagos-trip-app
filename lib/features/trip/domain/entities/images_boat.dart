class ImagesBoat {
  final String image;
  final String description;

  ImagesBoat({required this.image, required this.description});

  factory ImagesBoat.fromJson(Map<String, dynamic> json) {
    return ImagesBoat(image: json['image'], description: json['description']);
  }

  static List<ImagesBoat> parseBoats(List<dynamic> listBoats) {
    List<ImagesBoat> empty = [];
    if (listBoats.isEmpty) return empty;
    return listBoats
        .map<ImagesBoat>((json) => ImagesBoat.fromJson(json))
        .toList();
  }
}
