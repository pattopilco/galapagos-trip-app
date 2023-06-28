import 'package:galapagos_trip_app/features/galapagos/domain/entities/content.dart';

class Information {
  final int id;
  final String itemTitle;
  final List<Content> description;

  Information(
      {required this.id, required this.itemTitle, required this.description});

  static Information empty() {
    return Information(id: -1, itemTitle: '', description: List.empty());
  }

  static Information init() {
    return Information(
        id: 0, itemTitle: 'Description', description: Content.listInit());
  }

  static List<Information> parseContents(List<dynamic> listInformation) {
    List<Information> empty = [];
    if (listInformation.isEmpty) return empty;
    return listInformation
        .map<Information>((json) => Information.fromJson(json))
        .toList();
  }

  factory Information.fromJson(Map<String, dynamic> json) {
    return Information(
        id: json['id'] as int,
        itemTitle: json['itemTitle'],
        description: Content.parseContents(json['description']));
  }

  Information toInformationEntity() => Information(
        id: id,
        itemTitle: itemTitle,
        description: description,
      );
}
