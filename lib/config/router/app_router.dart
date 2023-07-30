import 'package:galapagos_trip_app/features/galapagos/screens/galapagos_screen.dart';
import 'package:galapagos_trip_app/features/packing/screens/packing_screen.dart';
import 'package:go_router/go_router.dart';
import '../../features/before/screens/before_screen.dart';
import '../../features/cruise/screens/cruise_screen.dart';
import '../../features/emergency/screen/emergency_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/trip/screens/my_trip_screen.dart';
import '../../features/weather/screen/weather_screen.dart';

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
      path: '/galapagos',
      builder: (context, state) => const GalapagosScreen(),
    ),
    GoRoute(
      path: '/before',
      builder: (context, state) => const BeforeScreen(),
    ),
    GoRoute(
      path: '/packing',
      builder: (context, state) => const PackingScreen(),
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
