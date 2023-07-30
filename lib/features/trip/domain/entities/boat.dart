import 'package:galapagos_trip_app/features/trip/domain/entities/images_boat.dart';

class Boat {
  final int code;
  final String name;
  final int category;
  final String categoryII;
  final String type;
  final int passengers;
  final int year;
  final String length;
  final String beam;
  final String draft;
  final String speed;
  final String description;
  final String image;
  final int minimumAgeChild;
  final int maximumAgeChild;
  final List<String> itineraryTypes;
  final List<String> keyFeatures;
  final List<String> images;
  final String logo;
  final String webLink;
  final List<ImagesBoat> imagesBoat;

  Boat(
      {required this.code,
      required this.name,
      required this.category,
      required this.categoryII,
      required this.type,
      required this.passengers,
      required this.year,
      required this.length,
      required this.beam,
      required this.draft,
      required this.speed,
      required this.description,
      required this.image,
      required this.minimumAgeChild,
      required this.maximumAgeChild,
      required this.itineraryTypes,
      required this.keyFeatures,
      required this.images,
      required this.logo,
      required this.webLink,
      required this.imagesBoat});

  factory Boat.fromJson(Map<String, dynamic> json) {
    return Boat(
        code: json['code'] as int,
        name: json['name'],
        category: json['category'] as int,
        categoryII: json['categoryII'],
        type: json['type'],
        passengers: json['passengers'] as int,
        year: json['year'] as int,
        length: json['length'],
        beam: json['beam'],
        //draft: json['draft'],
        draft: 'draft',
        speed: json['speed'],
        description: json['description'],
        image: json['image'],
        minimumAgeChild: json['minimumAgeChild'] as int,
        maximumAgeChild: json['maximumAgeChild'] as int,
        itineraryTypes: json['itineraryTypes'],
        keyFeatures: json['keyFeatures'],
        images: json['images'],
        logo: json['logo'],
        webLink: json['webLink'],
        imagesBoat: ImagesBoat.parseBoats(json['imagesBoat']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    data['category'] = category;
    data['categoryII'] = categoryII;
    data['type'] = type;
    data['passengers'] = passengers;
    data['year'] = year;
    data['length'] = length;
    data['beam'] = beam;
    data['draft'] = draft;
    data['speed'] = speed;
    data['description'] = description;
    data['image'] = image;
    data['minimumAgeChild'] = minimumAgeChild;
    data['minimumAgeChild'] = maximumAgeChild;
    data['itineraryTypes'] = itineraryTypes;
    data['keyFeatures'] = keyFeatures;
    data['images'] = images;
    data['logo'] = logo;
    data['webLink'] = webLink;
    data['imagesBoat'] = imagesBoat;

    return data;
  }
}
