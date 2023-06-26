import 'package:flutter/material.dart';

import '../../../config/helpers/responsive.dart';
import '../../../presentation/widgets/commons/generic_container_menu.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericContainerMenu(
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.all(Responsive(context).widthp(100) * 0.03),
          child: Column(
            children: <Widget>[
              Card(
                elevation: 10.0,
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
              SizedBox(height: Responsive(context).heightp(50) * 0.03),
              Card(
                elevation: 10.0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  height: 170,
                  color: const Color(0xff293643),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Galapagos Weather',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                              )),
                        ],
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
