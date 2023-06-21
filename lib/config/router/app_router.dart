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
        path: '/cruise/:id',
        name: CruiseScreen.name,
        builder: (context, state) {
          final String cruiseId = state.pathParameters['id'] ?? 'no-id';
          if (cruiseId != 'no-id') {
            return CruiseScreen(cruiceId: int.parse(cruiseId));
          }
          return const CruiseScreen(cruiceId: 293);
        }),
  ],
);
