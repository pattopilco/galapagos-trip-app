import 'package:flutter/material.dart';
import 'package:galapagos_trip_app/features/weather/domain/entities/information/weather_information.dart';
import '../../../config/helpers/responsive.dart';
import '../../galapagos/widgets/modal_title_list.dart';
import '../presentation/providers/weather_information_provider.dart';

class ModalWeatherBottomList extends StatelessWidget {
  final List<WeatherInformation> listItem;
  final WeatherInformationState weatherInformationProv;
  final WeatherInformationNotifier weatherInformationNoti;
  const ModalWeatherBottomList({
    super.key,
    required this.listItem,
    required this.weatherInformationProv,
    required this.weatherInformationNoti,
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
                      weatherInformationProv.weatherInformation.itemTitle,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: Responsive(context).inchp(10) * 0.2,
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
                        color: Colors.black12),
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

  showMenu(BuildContext context, List<WeatherInformation> listItem) {
    showModalBottomSheet(
        //elevation: 100,
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

  List<Widget> buildList(
      BuildContext context, List<WeatherInformation> listItem) {
    var titulo = "";
    List<Widget> listItemWidget = [];
    listItem.asMap().forEach((index, element) {
      listItemWidget.add(ModalTitleList(
          selected: false,
          textStyle: const TextStyle(color: Colors.white),
          title: element.itemTitle,
          onTap: () {
            titulo = element.itemTitle;
            weatherInformationNoti.selectWeatherInformation(element.id);
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
