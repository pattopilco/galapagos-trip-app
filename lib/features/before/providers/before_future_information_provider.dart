import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/features/before/domain/entities/destination.dart';
import '../infraestructure/repositories/before_repository_impl.dart';

final listBeforeInformationProvider =
    FutureProvider<List<Destination>>((ref) async {
  final listBeforeInformation = await BeforeRepositoryImpl().getAll();
  return listBeforeInformation;
});
