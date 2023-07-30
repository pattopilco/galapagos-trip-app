import 'package:galapagos_trip_app/features/trip/domain/entities/booking.dart';

import '../../domain/domaint.dart';
import '../datasources/trip_datasource_impl.dart';

class TripRepositoryImpl extends TripRepository {
  final TripDataSource tripDataSource;

  TripRepositoryImpl({TripDataSource? tripDataSource})
      : tripDataSource = tripDataSource ?? TripDataSourceImpl();

  @override
  Future<Boat> findBoat(String codeBoat, String token) {
    return tripDataSource.findBoat(codeBoat, token);
  }

  @override
  Future<Booking> findBooking(String codeVoucher, String token) {
    return tripDataSource.findBooking(codeVoucher, token);
  }

  @override
  Future<String> findFleet() {
    return tripDataSource.findFleet();
  }

  @override
  Future<Token> findToken() {
    return tripDataSource.findToken();
  }

  @override
  Future<dynamic> findBoatResponse(String codeBoat, String token) {
    return tripDataSource.findBoatResponse(codeBoat, token);
  }
}
