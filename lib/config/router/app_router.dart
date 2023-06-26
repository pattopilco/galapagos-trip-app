import 'package:go_router/go_router.dart';
import '../../features/cruise/screens/cruise_screen.dart';
import '../../features/emergency/screen/emergency_screen.dart';
import '../../features/weather/screen/weather_screen.dart';
import '../../presentation/screens/screens.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/trip',
      builder: (context, state) => const MyTripScreen(),
    ),
    GoRoute(
      path: '/cruise',
      builder: (context, state) => const CruiseScreen(),
    ),
    GoRoute(
      path: '/weather',
      builder: (context, state) => const WeatherScreen(),
    ),
    GoRoute(
      path: '/emergency',
      builder: (context, state) => const EmergencyScreen(),
    ),
  ],
);
