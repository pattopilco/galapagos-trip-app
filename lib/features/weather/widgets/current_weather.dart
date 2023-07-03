import 'package:flutter/material.dart';
import 'package:galapagos_trip_app/features/weather/widgets/weather_info.dart';
import 'package:intl/intl.dart';

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

  const CurrentWeather(
      {super.key,
      required this.description,
      required this.temperature,
      required this.humidity,
      required this.pressure,
      required this.iconWeather,
      required this.cityName,
      required this.tempMax,
      required this.tempMin,
      required this.feelsLike});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 280,
      child: Card(
        elevation: 10.0,
        color: Color(0xff293643),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(9.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.yellow,
                    ),
                    Text(
                      cityName,
                      style: _style1,
                    ),
                    const SizedBox(height: 5.0),
                    //Text(
                    //  DateFormat.yMMMEd().add_jm().format(DateTime.now()),
                    //  style: _style2,
                    //),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: NetworkImage(
                        'https://openweathermap.org/img/wn/$iconWeather@2x.png'),
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                    temperature,
                    style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  const Text(
                    '°C',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: Colors.yellow),
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
            WeatherInfo(
              precip: 'Pre',
              uvi: 'Uvi',
            ),
          ],
        ),
      ),
    );
  }
}

const TextStyle _style1 = TextStyle(
  fontWeight: FontWeight.w500,
  color: Colors.white,
  fontSize: 33,
);
final TextStyle _style2 = TextStyle(
  fontWeight: FontWeight.w400,
  color: Colors.grey[700],
  fontSize: 16,
);
