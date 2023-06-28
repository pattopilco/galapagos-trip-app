import 'package:flutter/material.dart';
import 'package:galapagos_trip_app/features/galapagos/domain/entities/information.dart';

import '../../../config/helpers/responsive.dart';
import '../providers/gps_information_provider.dart';
import 'modal_title_list.dart';

class ModalBottomList extends StatelessWidget {
  final List<Information> listItem;
  final InformationState informationProv;
  const ModalBottomList(
      {super.key, required this.listItem, required this.informationProv});

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
                      informationProv.information.itemTitle,
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
                  const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  showMenu(BuildContext context, List<Information> listItem) {
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

  List<Widget> buildList(BuildContext context, List<Information> listItem) {
    var titulo = "";
    List<Widget> listItemWidget = [];
    listItem.asMap().forEach((index, element) {
      //if (index == 0) widget.texto = element["title"];
      listItemWidget.add(ModalTitleList(
          selected: false,
          textStyle: const TextStyle(color: Colors.white),
          title: element.itemTitle,
          onTap: () {
            titulo = element.itemTitle;
            //onTapFuntion(element.itemTitle);
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
