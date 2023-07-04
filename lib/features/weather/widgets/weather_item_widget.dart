import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../config/helpers/utils.dart';

class WeatherItem extends StatelessWidget {
  final String dataText;
  final String description;
  final String temperature;
  final String weatherMain;

  const WeatherItem({
    Key? key,
    required this.dataText,
    required this.description,
    required this.temperature,
    required this.weatherMain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MapString.mapStringToIcon(
                weatherMain,
                65,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat.yMMMEd()
                          .add_jm()
                          .format(DateTime.parse(dataText)),
                      style: _style2,
                    ),
                    Text(
                      toBeginningOfSentenceCase(description) ?? '',
                      style: _style1.copyWith(fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15.00,
              ),
              Text('$temperature°C | ${Farenheith.convert(temperature)}°F',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10.00,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const TextStyle _style1 = TextStyle(
  fontWeight: FontWeight.w700,
  color: Color(0xff293643),
  fontSize: 10,
);
final TextStyle _style2 = TextStyle(
  fontWeight: FontWeight.w400,
  color: Colors.grey[700],
  fontSize: 10,
);
