import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/features/galapagos/domain/entities/information.dart';
import 'package:galapagos_trip_app/features/galapagos/infraestructure/repositories/information_repository_impl.dart';

import '../domain/repositories/information_repository.dart';

final informationProvider =
    StateNotifierProvider<InformationNotifier, InformationState>((ref) {
  final repository = InformationRepositoryImpl();
  final Information informationEmpty = Information.init();
  return InformationNotifier(
      repository: repository, information: informationEmpty);
});

class InformationNotifier extends StateNotifier<InformationState> {
  final InformationRepository repository;
  final Information information;
  InformationNotifier({required this.information, required this.repository})
      : super(InformationState(information: information));

  Future<List<Information>> getAllInformation() async {
    final informationList = await repository.getAll();
    return informationList;
  }

  Future<void> selectInformation(int id) async {
    late List<Information> listInformation = [];
    final lista = await repository.getAll();
    listInformation = lista.where((element) => element.id == id).toList();
    state = state.copyWith(index: id, information: listInformation[0]);
  }
}

// 3.Estado Menu
class InformationState {
  final int? index;
  final Information information;
  InformationState({this.index, required this.information});
  InformationState copyWith({int? index, required information}) =>
      InformationState(index: index, information: information);
}
