import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:galapagos_trip_app/features/before/domain/entities/destination.dart';
import '../../domain/dasources/before_datasource.dart';

class LocalBeforeDatasource implements BeforeDatasource {
  final String _data = 'assets/data/local_before_information.json';

  @override
  Future<List<Destination>> getAll() async {
    final result = await _getBeforeInformation();
    final List<Destination> resultList =
        result.map<Destination>((json) => Destination.fromJson(json)).toList();
    return resultList;
  }

  Future<dynamic> _getBeforeInformation() async {
    final result = await rootBundle.loadString(_data);
    return jsonDecode(result);
  }
}
