import 'package:galapagos_trip_app/features/before/domain/entities/destination.dart';

import '../../domain/dasources/before_datasource.dart';
import '../../domain/repository/before_repository.dart';
import '../datasources/local_before_ds_impl.dart';

class BeforeRepositoryImpl extends BeforeRepository {
  final BeforeDatasource beforeDatasource;

  BeforeRepositoryImpl({BeforeDatasource? beforeDatasource})
      : beforeDatasource = beforeDatasource ?? LocalBeforeDatasource();

  @override
  Future<List<Destination>> getAll() {
    return beforeDatasource.getAll();
  }
}
