import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class UvIndex {
  static String mapUviValueToString({required dynamic uvi}) {
    String uvIndex;
    if (uvi <= 2) {
      return uvIndex = 'Low';
    } else if (uvi <= 5) {
      return uvIndex = 'Medium';
    } else if (uvi <= 7) {
      return uvIndex = 'High';
    } else if (uvi <= 10) {
      return uvIndex = 'Very High';
    } else if (uvi >= 11) {
      return uvIndex = 'Extreme';
    } else {
      uvIndex = 'Unknown';
    }
    return uvIndex;
  }
}

class MapString {
  static Widget mapInputToWeather(BuildContext context, String input) {
    String text;
    switch (input) {
      case 'Tornado':
        text = 'Tornado';
        break;
      case 'Thunderstorm':
        text = 'Thunderstorm';
        break;
      case 'Drizzle':
        text = 'Drizzly';
        break;
      case 'Rain':
        text = 'Raining';
        break;
      case 'Snow':
        text = 'Snowing';
        break;
      case 'Mist':
        text = 'Misty';
        break;
      case 'fog':
        text = 'Foggy';
        break;
      case 'Smoke':
        text = 'Smoky';
        break;
      case 'Squall':
        text = 'Squally';
        break;
      case 'Haze':
        text = 'Hazy';
        break;
      case 'Dust':
        text = 'Dusty';
        break;
      case 'Sand':
        text = 'Sandy';
        break;
      case 'Ash':
        text = 'Ashy';
        break;
      case 'Clear':
        text = "Sunny";
        break;
      case 'Clouds':
        text = "Cloudy";
        break;
      default:
        text = "No Info";
    }
    return Text(
      text,
      style: const TextStyle(
        fontSize: 15,
      ),
    );
  }

  static Icon mapStringToIcon(String input, double iconSize) {
    IconData icon;
    switch (input) {
      case 'Thunderstorm':
        icon = MdiIcons.weatherLightningRainy;
        break;
      case 'Drizzle':
        icon = MdiIcons.weatherPartlyRainy;
        break;
      case 'Rain':
        icon = MdiIcons.weatherRainy;
        break;
      case 'Snow':
        icon = MdiIcons.weatherSnowy;
        break;
      case 'Clear':
        icon = MdiIcons.weatherSunny;
        break;
      case 'Clouds':
        icon = MdiIcons.weatherCloudy;
        break;
      case 'Mist':
        icon = MdiIcons.weatherFog;
        break;
      case 'fog':
        icon = MdiIcons.weatherFog;
        break;
      case 'Smoke':
        icon = MdiIcons.smoke;
        break;
      case 'Haze':
        icon = MdiIcons.weatherHazy;
        break;
      case 'Dust':
      case 'Sand':
      case 'Ash':
        icon = MdiIcons.weatherDust;
        break;
      case 'Squall':
      case 'Tornado':
        icon = MdiIcons.weatherTornado;
        break;
      default:
        icon = MdiIcons.weatherCloudy;
    }
    return Icon(icon, size: iconSize, color: Colors.blue);
  }
}

class Farenheith {
  static String convert(String centigrados) {
    double returnConvertValue = double.parse(centigrados) * 1.8 + 32;
    return returnConvertValue.round().toString();
  }
}

class DateFormated {
  static dynamic dayOfWeek(dynamic date) {
    return DateFormat('EEE').format(date);
  }

  static String validateDateNull(String? dateStr) {
    final dateNow = DateTime.now();
    if (dateStr == null || dateStr.isEmpty) {
      return DateFormat('EEE').format(dateNow);
    } else {
      return DateFormat('EEE').format(DateTime.parse(dateStr));
    }
  }

  static String validateDateFullNull(String? dateStr) {
    final dateNow = DateTime.now();
    if (dateStr == null || dateStr.isEmpty) {
      return DateFormat.yMd().format(dateNow);
    } else {
      return DateFormat.yMd().format(DateTime.parse(dateStr));
    }
  }

  static String validateHourNull(String? dateStr) {
    final dateNow = DateTime.now();
    if (dateStr == null) return DateFormat.Hms().format(dateNow);
    return DateFormat.Hms().format(DateTime.parse(dateStr));
  }
}

class StyleUtil {
  static TextStyle styleColorPrimaryFont14(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: 14,
    );
  }
}
