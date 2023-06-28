import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/features/galapagos/domain/entities/content.dart';
import 'package:galapagos_trip_app/features/galapagos/providers/gps_information_provider.dart';
import 'package:galapagos_trip_app/presentation/widgets/commons/generic_container_menu.dart';
import '../../../presentation/widgets/commons/generic_container_menu.dart';
import '../../../presentation/widgets/commons/generic_container_menu.dart';
import '../../../presentation/widgets/commons/generic_container_menu.dart';
import '../domain/entities/information.dart';
import '../providers/gps_future_information_provider.dart';
import '../widgets/content_card.dart';
import '../widgets/modal_bottom_list.dart';

class GalapagosScreen extends ConsumerWidget {
  const GalapagosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Information>> _listInformationProv =
        ref.watch(listInformationProvider);

    final _informationProv = ref.watch(informationProvider);

    return GenericContainerMenu(
      body: Container(
        color: Color(0xff5e1f20).withOpacity(0.3),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              _listInformationProv.when(
                data: (lista) {
                  return ModalBottomList(
                    listItem: lista,
                    informationProv: _informationProv,
                  );
                },
                error: (err, stack) => Text('Error: $err'),
                loading: () => const CircularProgressIndicator(),
              ),
              Column(
                children: getCardList(informationState: _informationProv),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> getCardList({required InformationState informationState}) {
  List<Widget> listResult = [];
  List<Content> descriptionList = informationState.information.description;
  if (descriptionList != null && descriptionList.isNotEmpty) {
    descriptionList.asMap().forEach((index, content) {
      listResult.add(ContentCard(
        title: content.subtitle,
        description: content.textContent,
        image: content.imageTitle,
      ));
    });
  }
  return listResult;
}
