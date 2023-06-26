import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static initEnvironment() async {
    await dotenv.load(fileName: ".env");
  }

  static String keyToken = dotenv.env['KEY_TOKEN'] ?? 'Error keyToken';
  static String apiUrl = dotenv.env['API_URL'] ?? 'Error ApiUrl';
  static String apiToken = dotenv.env['API_TOKEN'] ?? 'Error apiToken';
  static String apiFleet = dotenv.env['API_FLEET'] ?? 'Error apiFleet';
  static String apiBooking = dotenv.env['API_BOOKING'] ?? 'Error apiBooking';
  static String apiBoat = dotenv.env['API_BOAT'] ?? 'Error apiBoat';
}
