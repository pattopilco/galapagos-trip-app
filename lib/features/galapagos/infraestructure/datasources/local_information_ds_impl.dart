import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:galapagos_trip_app/features/galapagos/domain/datasources/information_datasource.dart';
import 'package:galapagos_trip_app/features/galapagos/domain/entities/information.dart';

class LocalInformationDatasource implements InformationDatasource {
  @override
  Future<List<Information>> getAll() async {
    final result = await _getGpsInformation();
    final List<Information> resultList =
        result.map<Information>((json) => Information.fromJson(json)).toList();
    return resultList;
  }

  Future<dynamic> _getGpsInformation() async {
    final result =
        await rootBundle.loadString('assets/data/local_gps_information.json');
    return jsonDecode(result);
  }
}
