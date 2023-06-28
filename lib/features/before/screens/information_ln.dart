import 'dart:convert';

import 'package:flutter/services.dart';

class InformationLn {
  Future<dynamic> getInformation() async {
    final result =
        await rootBundle.loadString("assets/data/information/information.json");
    return jsonDecode(result);
  }

  Future<List> getDestinationInformation() async {
    final List lugaresList = [];
    final result = await getInformation();
    result.asMap().forEach((index, element) {
      lugaresList.add({"title": element["destination"]});
    });

    return lugaresList;
  }

  Future<dynamic> geDescriptiontList(String destination) async {
    final List result = await getInformation();

    return result.firstWhere((element) => element["destination"] == destination,
        orElse: null);
  }
}
