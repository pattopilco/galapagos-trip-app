import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/features/galapagos/domain/entities/information.dart';
import 'package:galapagos_trip_app/features/galapagos/infraestructure/repositories/information_repository_impl.dart';

final listInformationProvider = FutureProvider<List<Information>>((ref) async {
  final listInformation = await InformationRepositoryImpl().getAll();
  return listInformation;
});
