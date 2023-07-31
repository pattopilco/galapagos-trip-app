import 'package:flutter/material.dart';
import '../../../config/helpers/responsive.dart';
import '../../galapagos/widgets/modal_title_list.dart';
import '../domain/entities/destination.dart';
import '../providers/before_information_provider.dart';

class ModalFeatureBottomList extends StatelessWidget {
  final List<Destination> listItem;
  final BeforeInformationState beforeInformationProv;
  final BeforeInformationNotifier beforeInformationNoti;
  const ModalFeatureBottomList({
    super.key,
    required this.listItem,
    required this.beforeInformationProv,
    required this.beforeInformationNoti,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GestureDetector(
        onTap: () {
          showMenu(context, listItem);
        },
        child: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Responsive(context).heightp(15) * 0.6,
              width: Responsive(context).widthp(100),
              padding: EdgeInsets.symmetric(
                  horizontal: Responsive(context).widthp(10) * .4),
              color: Theme.of(context).colorScheme.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      beforeInformationProv.destination.destination,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: Responsive(context).inchp(12) * 0.2,
                      ),
                      softWrap: false,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topRight: Radius.elliptical(10, 10),
                            bottomLeft: Radius.elliptical(10, 10)),
                        color: Colors.black26),
                    height: 35,
                    width: 40,
                    child: const Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  showMenu(BuildContext context, List<Destination> listItem) {
    showModalBottomSheet(
        elevation: 100,
        context: context,
        builder: (BuildContext context) {
          return Container(
              color: Theme.of(context).colorScheme.primary,
              child: Wrap(
                children: <Widget>[
                  Column(
                    children: buildList(context, listItem),
                  ),
                ],
              ));
        });
  }

  List<Widget> buildList(BuildContext context, List<Destination> listItem) {
    var titulo = "";
    List<Widget> listItemWidget = [];
    listItem.asMap().forEach((index, element) {
      listItemWidget.add(ModalTitleList(
          selected: false,
          textStyle: const TextStyle(color: Colors.white),
          title: element.destination,
          onTap: () {
            titulo = element.destination;
            beforeInformationNoti.selectBeforeInformation(element.id);
            Navigator.of(context).pop();
          }));
      if (index != listItem.length - 1) {
        listItemWidget.add(const Divider(
          color: Colors.white,
        ));
      }
    });
    return listItemWidget;
  }
}
