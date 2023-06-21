import 'package:galapagos_trip_app/features/trip/domain/domaint.dart';

class TokenMapper {
  static Token tokenJsonToEntity(Map<String, dynamic> json) => Token(
      token: json['token'] ?? '',
      status: json['status'] ?? false,
      message: json['message'] ?? '');
}
