import 'dart:convert';

import 'package:flutter/services.dart';

class GalapagosLn {
  Future<dynamic> getGpsInformation() async {
    final result =
        await rootBundle.loadString("assets/data/galapagos/gps_information.json");
    return jsonDecode(result);
  }

  Future<List> getItems() async {
    final List lugaresList = [];
    final result = await getGpsInformation();
    result.asMap().forEach((index, element) {
      lugaresList.add({"title": element["itemTitle"]});
    });

    return lugaresList;
  }

  Future<dynamic> geDescriptiontList(String destination) async {
    final List result = await getGpsInformation();

    return result.firstWhere((element) => element["itemTitle"] == destination,
        orElse: null);
  }
}
