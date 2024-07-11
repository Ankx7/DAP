import 'package:go_router/go_router.dart';
import 'package:login_ana/presentation/screens/details_screen.dart';
import 'package:login_ana/presentation/screens/games_screen.dart';
import 'package:login_ana/presentation/screens/login_screen.dart';

final appRouter = GoRouter(initialLocation: '/login', routes: [
  GoRoute(
    path: '/login',
    builder: (context, state) => LoginScreen(),
  ),
  GoRoute(
    path: '/details',
    builder: (context, state) => DetailsScreen(
       game: state.extra as dynamic,
    ),
  ),
  GoRoute(
    path: '/games',
    builder: (context, state) => GamesScreen(),
  )
]);
