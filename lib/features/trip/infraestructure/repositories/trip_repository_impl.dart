import '../../domain/domaint.dart';
import '../datasources/trip_datasource_impl.dart';

class TripRepositoryImpl extends TripRepository {
  final TripDataSource tripDataSource;

  TripRepositoryImpl(TripDataSource? tripDataSource)
      : tripDataSource = tripDataSource ?? TripDataSourceImpl();

  @override
  Future<String> findBoat() {
    return tripDataSource.findBoat();
  }

  @override
  Future<String> findBooking() {
    return tripDataSource.findBooking();
  }

  @override
  Future<String> findFleet() {
    return tripDataSource.findFleet();
  }

  @override
  Future<String> findToken(String keyToken) {
    return tripDataSource.findToken(keyToken);
  }
}
