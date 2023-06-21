import 'package:galapagos_trip_app/features/trip/domain/domaint.dart';
import 'package:galapagos_trip_app/features/trip/domain/entities/images_boat.dart';

class BoatMapper {
  static Boat boatJsonToEntity(Map<String, dynamic> json) => Boat(
        code: json['code'] ?? '',
        name: json['name'] ?? '',
        category: json['category'] ?? '',
        categoryII: json['categoryII'] ?? '',
        type: json['type'] ?? '',
        passengers: json['passengers'],
        year: json['year'],
        length: json['length'],
        beam: json['beam'],
        draft: json['draft'],
        speed: json['speed'],
        description: json['description'],
        image: json['image'],
        minimumAgeChild: json['minimumAgeChild'],
        maximumAgeChild: json['maximumAgeChild'],
        itineraryTypes: List<String>.from(json['itineraryTypes'])
            .map((iti) => iti)
            .toList(),
        keyFeatures:
            List<String>.from(json['keyFeatures']).map((key) => key).toList(),
        images: List<String>.from(json['images']).map((ima) => ima).toList(),
        logo: json['logo'],
        webLink: json['webLink'],
        imagesBoat: ImagesBoat.parseBoats(json['imagesBoat']),
      );
}
