import 'package:galapagos_trip_app/features/trip/domain/domaint.dart';
import 'package:galapagos_trip_app/features/trip/domain/entities/booking.dart';

abstract class TripDataSource {
  Future<Token> findToken();
  Future<String> findFleet();
  Future<Booking> findBooking(String codeVoucher, String token);
  Future<Boat> findBoat(String codeBoat, String token);
}
