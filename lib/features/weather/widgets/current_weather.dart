import 'package:flutter/material.dart';
import 'package:galapagos_trip_app/features/weather/domain/entities/openweathermap/daily_weather.dart';
import 'package:galapagos_trip_app/features/weather/widgets/sevenday_forecast.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../config/helpers/utils.dart';

class CurrentWeather extends StatelessWidget {
  final String cityName;
  final String description;
  final String temperature;
  final String humidity;
  final String pressure;
  final String iconWeather;
  final String tempMax;
  final String tempMin;
  final String feelsLike;
  final String iconMain;
  final List<DailyWeather> listDailyWeather;

  const CurrentWeather({
    super.key,
    required this.description,
    required this.temperature,
    required this.humidity,
    required this.pressure,
    required this.iconWeather,
    required this.iconMain,
    required this.cityName,
    required this.tempMax,
    required this.tempMin,
    required this.feelsLike,
    required this.listDailyWeather,
  });

  @override
  Widget build(BuildContext context) {
    final controller = PageController(viewportFraction: 0.8, keepPage: true);
    return SizedBox(
      width: double.infinity,
      height: 360,
      child: Card(
        //elevation: 10.0,
        //color: Color(0xff293643),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: Center(
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 2,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Theme.of(context).colorScheme.primary,
                    dotHeight: 6,
                    dotWidth: 6,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(9.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    Text(
                      cityName,
                      style: _style1,
                    ),
                    //const SizedBox(height: 5.0),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Center(
                child: Text(
                  DateFormat.yMMMEd().add_jm().format(DateTime.now()),
                  style: _style2,
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MapString.mapStringToIcon(
                    iconMain,
                    55,
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                    temperature,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  Text(
                    '°C',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  Text(
                    '|',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  Text(
                    Farenheith.convert(temperature),
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  Text(
                    '°F',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${tempMax.split('.')[0]}°/${tempMin.split('.')[0]}° Feels like ${feelsLike.split('.')[0]}°',
                    style: _style1.copyWith(fontSize: 14),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    toBeginningOfSentenceCase(description) ?? '',
                    style: _style1.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Next Days',
                style: StyleUtil.styleColorPrimaryFont14(context),
              ),
            ),
            SevenDayForecast(listDailyWeather: listDailyWeather),
          ],
        ),
      ),
    );
  }
}

const TextStyle _style1 = TextStyle(
  fontWeight: FontWeight.w700,
  color: Color(0xff293643),
  fontSize: 28,
);
final TextStyle _style2 = TextStyle(
  fontWeight: FontWeight.w400,
  color: Colors.grey[700],
  fontSize: 16,
);
