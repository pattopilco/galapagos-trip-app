import 'package:galapagos_trip_app/features/trip/domain/entities/booking.dart';
import 'package:galapagos_trip_app/features/trip/infraestructure/mappers/document_mapper.dart';

class BookingMapper {
  static Booking bookingJsonToEntity(Map<String, dynamic> json) => Booking(
      reference: json['reference'] ?? '',
      codeBoat: json['codeBoat'] ?? 0,
      codeVoucher: json['codeVoucher'] ?? 0,
      codeVoucherEncrypted: json['codeVoucherEncrypted'] ?? '',
      documents: DocumentMapper.parseDocuments(json['documents']));
}
