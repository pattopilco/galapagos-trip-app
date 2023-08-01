import 'package:dart_date/dart_date.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/openweathermap/forecast/list.dart';

final dailyProvider = StateNotifierProvider<DailyNotifier, DailyState>((ref) {
  return DailyNotifier(
      listForescastDay: List.empty(), dateDailyForescast: DateTime.now());
});

class DailyNotifier extends StateNotifier<DailyState> {
  final List<Lista> listForescastDay;
  final DateTime dateDailyForescast;

  DailyNotifier(
      {required this.listForescastDay, required this.dateDailyForescast})
      : super(DailyState(
            listForescastDay: listForescastDay,
            dateDailyForescast: dateDailyForescast));

  void findListForescastForDay(List<Lista> listForescast, DateTime? dateTime) {
    if (dateTime == null) {
      state = state.copyWith(
          listForescastDay: listForescast, dateDailyForescast: DateTime.now());
    } else {
      List<Lista> listForescastDay =
          _listForescastForDate(listForescast, dateTime);
      state = state.copyWith(
          listForescastDay: listForescastDay, dateDailyForescast: dateTime);
    }
  }

  List<Lista> _listForescastForDate(
      List<Lista> listForescast, DateTime dateTime) {
    return listForescast
        .where(
            (forescast) => DateTime.parse(forescast.dttxt).isSameDay(dateTime))
        .toList();
  }
}

class DailyState {
  final List<Lista> listForescastDay;
  final DateTime dateDailyForescast;

  DailyState(
      {required this.listForescastDay, required this.dateDailyForescast});

  DailyState copyWith(
          {required List<Lista> listForescastDay,
          required DateTime dateDailyForescast}) =>
      DailyState(
          listForescastDay: listForescastDay,
          dateDailyForescast: dateDailyForescast);
}
