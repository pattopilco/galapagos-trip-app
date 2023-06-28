import 'package:galapagos_trip_app/features/galapagos/domain/datasources/information_datasource.dart';
import 'package:galapagos_trip_app/features/galapagos/domain/entities/information.dart';
import 'package:galapagos_trip_app/features/galapagos/infraestructure/datasources/local_information_ds_impl.dart';

import '../../domain/repositories/information_repository.dart';

class InformationRepositoryImpl extends InformationRepository {
  final InformationDatasource informationDatasource;

  InformationRepositoryImpl({InformationDatasource? informationDatasource})
      : informationDatasource =
            informationDatasource ?? LocalInformationDatasource();

  @override
  Future<List<Information>> getAll() {
    return informationDatasource.getAll();
  }
}
