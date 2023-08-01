import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/features/weather/domain/entities/information/weather_description.dart';
import 'package:galapagos_trip_app/features/weather/domain/entities/information/weather_information.dart';
import '../../../config/helpers/responsive.dart';
import '../../commons/internet/warning_widget_change_notifier.dart';
import '../../commons/menu/widgets/generic_container_menu.dart';
import '../../galapagos/widgets/content_card.dart';
import '../presentation/providers/weather_future_information_provider.dart';
import '../presentation/providers/weather_information_provider.dart';
import '../widgets/galapagos_weather.dart';
import '../widgets/modal_weather_bottom_list.dart';
import '../widgets/online_widget_change_notifier.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<WeatherInformation>> _listWeatherInformationProv =
        ref.watch(listWeatherInformationProvider);

    final _weatherInformationProv = ref.watch(weatherInformationProvider);
    final _weatherInformationNoti =
        ref.watch(weatherInformationProvider.notifier);

    return GenericContainerMenu(
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.all(Responsive(context).widthp(100) * 0.03),
          child: Column(
            children: <Widget>[
              Card(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(
                          Responsive(context).widthp(100) * 0.07),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'The Islands are located in a place that makes anytime a great time to visit. There are two seasons. The “dry season” is between December and May where the sky is always clear and the sun is strong.  During the “wet season” of June to November, the weather is a little cooler and ideal for diving and enjoying the best of Galapagos’ famous marine life.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: Responsive(context).inchp(8) * 0.2),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const WarningWidgetChangeNotifier(),
              const OnlineWidgetChangeNotifier(),
              _listWeatherInformationProv.when(
                data: (lista) {
                  return ModalWeatherBottomList(
                    listItem: lista,
                    weatherInformationProv: _weatherInformationProv,
                    weatherInformationNoti: _weatherInformationNoti,
                  );
                },
                error: (err, stack) => Text('Error: $err'),
                loading: () => const CircularProgressIndicator(),
              ),
              Column(
                children: getCardList(
                    weatherInformationState: _weatherInformationProv),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> getCardList(
    {required WeatherInformationState weatherInformationState}) {
  List<Widget> listResult = [];
  List<WeatherDescription> descriptionList =
      weatherInformationState.weatherInformation.description;
  if (descriptionList != null && descriptionList.isNotEmpty) {
    descriptionList.asMap().forEach((index, description) {
      listResult.add(ContentCard(
        title: description.subtitle,
        titleLabel: '',
        description: description.textContent,
        image: description.imageTitle,
      ));
    });
  }
  return listResult;
}
