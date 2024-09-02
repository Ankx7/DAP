import 'package:go_router/go_router.dart';
import 'package:riverpod_listview/screens/edit_name_screen.dart';
import 'package:riverpod_listview/screens/home_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/edit_name',
      builder: (context, state) => const EditNameScreen(),
    ),
    GoRoute(
      path: '/edit_name/:name',
      builder: (context, state) {
        final name = state.pathParameters['name'] ?? '';
        return EditNameScreen(name: name);
      },
    ),
  ],
);
