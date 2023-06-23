class CruiseService {
  String getListItinerariesFleet(List lista) {
    final List<int> newList = lista.map((e) => int.parse(e)).toList();
    newList.sort((a, b) => a.compareTo(b));
    newList.removeWhere((a) => a > 8);
    return "${newList.join(",")} days";
  }
}
