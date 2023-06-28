import '../entities/information.dart';

abstract class InformationRepository {
  Future<List<Information>> getAll();
}
