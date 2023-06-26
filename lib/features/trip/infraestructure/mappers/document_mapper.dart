import 'package:galapagos_trip_app/features/trip/domain/entities/document.dart';

class DocumentMapper {
  static Document documentJsonToEntity(Map<String, dynamic> json) => Document(
      description: json['description'] ?? '',
      url: json['url'] ?? 0,
      name: json['name'] ?? '');

  static List<Document> parseDocuments(List<dynamic> listDocuments) {
    List<Document> empty = [];
    if (listDocuments.isEmpty) return empty;
    return listDocuments
        .map<Document>((json) => documentJsonToEntity(json))
        .toList();
  }
}
