import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/features/weather/presentation/providers/isla_providers.dart';
import '../../../config/helpers/utils.dart';
import 'current_weather.dart';
import 'forescast_weather.dart';

class GalapagosWeather extends ConsumerWidget {
  const GalapagosWeather({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFilterIsla = ref.watch(islaFilterProvider);
    final islaOwm = ref.read(filteredIslaProvider);
    final owmProv = ref.watch(owmProvider);

    return Card(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: 740,
            child: Card(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                height: 100,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const Center(
                      child: Text('Galapagos Weather',
                          style: TextStyle(
                              color: Color(0xff293643),
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: SegmentedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (Set<MaterialState> states) {
                            return states.contains(MaterialState.selected)
                                ? Theme.of(context).colorScheme.primary
                                : Colors.white;
                          }),
                          foregroundColor: MaterialStateColor.resolveWith(
                              (Set<MaterialState> states) {
                            return states.contains(MaterialState.selected)
                                ? Colors.white
                                : Theme.of(context).colorScheme.secondary;
                          }),
                        ),
                        segments: const [
                          ButtonSegment(
                              value: IslaFilter.scruz,
                              label: Text('Santa Cruz', textScaleFactor: 0.8)),
                          ButtonSegment(
                              value: IslaFilter.scristobal,
                              label:
                                  Text('San Cristobal', textScaleFactor: 0.8)),
                          ButtonSegment(
                              value: IslaFilter.isabela,
                              label: Text('Isabela', textScaleFactor: 0.8)),
                        ],
                        selected: <IslaFilter>{currentFilterIsla},
                        onSelectionChanged: (value) {
                          ref.read(islaFilterProvider.notifier).state =
                              value.first;
                        },
                      ),
                    ),
                    CurrentWeather(
                      cityName: convertName(currentFilterIsla.name),
                      description:
                          islaOwm.weather.weather[0].description.toString(),
                      humidity: '',
                      temperature:
                          islaOwm.weather.main.temp.toString().split('.').first,
                      pressure: '',
                      iconWeather: islaOwm.weather.weather[0].icon.toString(),
                      tempMin: islaOwm.weather.main.tempmin.toString(),
                      tempMax: islaOwm.weather.main.tempmax.toString(),
                      feelsLike: islaOwm.weather.main.feelslike.toString(),
                      iconMain: islaOwm.weather.weather[0].main.toString(),
                      listDailyWeather: owmProv.listNextDays,
                    ),
                    Text('* Select the day to see the weather details.',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Daily Forescast',
                        style: StyleUtil.styleColorPrimaryFont14(context),
                      ),
                    ),
                    const ForescastWeather(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String convertName(String isla) {
  if (IslaFilter.scruz.name == isla) return 'Santa Cruz Island';
  if (IslaFilter.scristobal.name == isla) return 'San Cristobal Island';
  if (IslaFilter.isabela.name == isla) return 'Isabela Island';
  return '';
}
