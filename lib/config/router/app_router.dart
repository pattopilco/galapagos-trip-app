import 'package:go_router/go_router.dart';
import '../../features/cruise/screens/cruise_screen.dart';
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
  ],
);
