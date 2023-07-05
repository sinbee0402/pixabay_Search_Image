import 'package:go_router/go_router.dart';
import 'package:search_image3/ui/detail/detail_screen.dart';
import 'package:search_image3/ui/main/main_screen.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MainScreen(),
      routes: [
        GoRoute(
          path: 'detail',
          builder: (context, state) => DetailScreen(),
        )
      ],
    ),
  ],
);
