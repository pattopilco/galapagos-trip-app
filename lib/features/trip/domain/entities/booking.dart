import 'package:galapagos_trip_app/features/trip/domain/entities/document.dart';

class Booking {
  final String reference;
  final int codeBoat;
  final int codeVoucher;
  final String? codeVoucherEncrypted;
  final List<Document> documents;

  Booking(
      {required this.reference,
      required this.codeBoat,
      required this.codeVoucher,
      this.codeVoucherEncrypted,
      required this.documents});
}
