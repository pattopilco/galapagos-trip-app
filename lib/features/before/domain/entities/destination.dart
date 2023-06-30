import 'package:galapagos_trip_app/features/before/domain/entities/question.dart';

class Destination {
  final int id;
  final String destination;
  final List<Question> description;

  Destination(
      {required this.id, required this.destination, required this.description});

  static Destination empty() {
    return Destination(id: -1, destination: '', description: List.empty());
  }

  static Destination init() {
    return Destination(
        id: 0, destination: 'Description', description: Question.listInit());
  }

  static List<Destination> parseQuestions(List<dynamic> listDestination) {
    List<Destination> empty = [];
    if (listDestination.isEmpty) return empty;
    return listDestination
        .map<Destination>((json) => Destination.fromJson(json))
        .toList();
  }

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
        id: json['id'] as int,
        destination: json['destination'],
        description: Question.parseQuestions(json['description']));
  }

  Destination toDestinationEntity() => Destination(
        id: id,
        destination: destination,
        description: description,
      );
}
