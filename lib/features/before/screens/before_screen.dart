import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/features/before/domain/entities/destination.dart';
import 'package:galapagos_trip_app/features/before/domain/entities/question.dart';

import '../../../presentation/widgets/commons/generic_container_menu.dart';
import '../../galapagos/widgets/content_card.dart';
import '../providers/before_future_information_provider.dart';
import '../providers/before_information_provider.dart';
import '../widgets/modal_features_bottom_list.dart';

class BeforeScreen extends ConsumerWidget {
  const BeforeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Destination>> _listBeforeInformationProv =
        ref.watch(listBeforeInformationProvider);

    final _beforeInformationProv = ref.watch(beforeInformationProvider);
    final _beforeInformationNoti =
        ref.watch(beforeInformationProvider.notifier);

    return GenericContainerMenu(
      body: Container(
        color: Color(0xff5e1f20).withOpacity(0.3),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              _listBeforeInformationProv.when(
                data: (lista) {
                  return ModalFeatureBottomList(
                    listItem: lista,
                    beforeInformationProv: _beforeInformationProv,
                    beforeInformationNoti: _beforeInformationNoti,
                  );
                },
                error: (err, stack) => Text('Error: $err'),
                loading: () => const CircularProgressIndicator(),
              ),
              Column(
                children:
                    getCardList(beforeInformationState: _beforeInformationProv),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> getCardList(
    {required BeforeInformationState beforeInformationState}) {
  List<Widget> listResult = [];
  List<Question> descriptionList =
      beforeInformationState.destination.description;
  if (descriptionList != null && descriptionList.isNotEmpty) {
    descriptionList.asMap().forEach((index, question) {
      listResult.add(ContentCard(
        title: question.question,
        description: question.ask,
        image: question.imageUrl,
      ));
    });
  }
  return listResult;
}
