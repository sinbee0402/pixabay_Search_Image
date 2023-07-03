import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:search_image1/data/model/photo.dart';
import 'package:search_image1/data/repository/pixabay_photo_repository_impl.dart';
import 'package:search_image1/ui/detail/detail_screen.dart';
import 'package:search_image1/ui/main/main_screen.dart';
import 'package:search_image1/ui/main/main_view_model.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (_) => MainViewModel(PixabayPhotoRepositoryImpl()),
          child: const MainScreen(),
        );
      },
    ),
    GoRoute(
      path: '/detail',
      builder: (context, state) {
        final photo = state.extra as Photo;
        return DetailScreen(data: photo);
      },
    ),
  ],
);
