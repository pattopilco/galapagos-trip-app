import 'package:galapagos_trip_app/features/galapagos/domain/entities/information.dart';

abstract class InformationDatasource {
  Future<List<Information>> getAll();
}
