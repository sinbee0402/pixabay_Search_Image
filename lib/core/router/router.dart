import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:search_image3/data/repository/pixabay_photo_repository_impl.dart';
import 'package:search_image3/domain/model/photo.dart';
import 'package:search_image3/presentation/detail/detail_screen.dart';
import 'package:search_image3/presentation/main/main_screen.dart';
import 'package:search_image3/presentation/main/main_view_model.dart';

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
