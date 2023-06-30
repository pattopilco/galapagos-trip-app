import 'package:galapagos_trip_app/features/before/domain/entities/destination.dart';

abstract class BeforeRepository {
  Future<List<Destination>> getAll();
}
