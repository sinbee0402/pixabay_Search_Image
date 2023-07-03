import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:search_image2/data/model/photo.dart';
import 'package:search_image2/ui/detail/detail_screen.dart';
import 'package:search_image2/ui/main/main_screen.dart';
import 'package:search_image2/ui/main/main_view_model.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (_) => MainViewModel(),
          child: const MainScreen(),
        );
      },
      routes: [
        GoRoute(
          path: 'detail',
          builder: (context, state) {
            final photo = state.extra as Photo;
            return DetailScreen(photo: photo);
          },
        )
      ],
    ),
  ],
);
