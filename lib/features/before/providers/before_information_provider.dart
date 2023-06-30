import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/features/before/domain/entities/destination.dart';
import 'package:galapagos_trip_app/features/before/domain/repository/before_repository.dart';
import 'package:galapagos_trip_app/features/before/infraestructure/repositories/before_repository_impl.dart';

final beforeInformationProvider =
    StateNotifierProvider<BeforeInformationNotifier, BeforeInformationState>(
        (ref) {
  final repository = BeforeRepositoryImpl();
  final Destination destinationEmpty = Destination.init();
  return BeforeInformationNotifier(
      repository: repository, destination: destinationEmpty);
});

class BeforeInformationNotifier extends StateNotifier<BeforeInformationState> {
  final BeforeRepository repository;
  final Destination destination;
  BeforeInformationNotifier(
      {required this.destination, required this.repository})
      : super(BeforeInformationState(destination: destination));

  Future<List<Destination>> getAllBeforeInformation() async {
    final beforeInformationList = await repository.getAll();
    return beforeInformationList;
  }

  Future<void> selectBeforeInformation(int id) async {
    late List<Destination> listBeforeInformation = [];
    final lista = await repository.getAll();
    listBeforeInformation = lista.where((element) => element.id == id).toList();
    state = state.copyWith(index: id, destination: listBeforeInformation[0]);
  }
}

// 3.Estado Menu
class BeforeInformationState {
  final int? index;
  final Destination destination;
  BeforeInformationState({this.index, required this.destination});
  BeforeInformationState copyWith({int? index, required destination}) =>
      BeforeInformationState(index: index, destination: destination);
}
