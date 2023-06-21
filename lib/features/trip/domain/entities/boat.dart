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
}
