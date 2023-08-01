import 'dart:async';

import 'package:flutter/material.dart';
import 'package:galapagos_trip_app/features/commons/internet/check_internet_connection.dart';

import '../../../main.dart';

class ConnectionStatusChangeNotifier extends ChangeNotifier {
  late StreamSubscription _connectionSuscription;

  ConnectionStatus status = ConnectionStatus.online;

  ConnectionStatusChangeNotifier() {
    _connectionSuscription =
        internetChecker.internetStatus().listen((newStatus) {
      status = newStatus;
      notifyListeners();
    });
  }
  @override
  void dispose() {
    _connectionSuscription.cancel();
    super.dispose();
  }
}
