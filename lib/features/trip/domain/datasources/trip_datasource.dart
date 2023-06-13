abstract class TripDataSource {
  Future<String> findToken(String keyToken);
  Future<String> findFleet();
  Future<String> findBooking();
  Future<String> findBoat();
}
