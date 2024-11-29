import 'package:go_router/go_router.dart';
import 'package:tp_final_firebase/presentation/edit_game_screen.dart';
import 'package:tp_final_firebase/presentation/home_screen.dart';
import 'package:tp_final_firebase/presentation/login_screen.dart';
import 'package:tp_final_firebase/presentation/signup_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => SignupScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/edit_game/:gameId',
      builder: (context, state) {
        final gameId = state.pathParameters['gameId'];
        if (gameId == null) {
          throw Exception('gameId requiered');
        }
        return EditGameScreen(gameId: gameId);
      },
    ),
  ],
);
