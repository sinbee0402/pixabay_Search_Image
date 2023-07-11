import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:search_image5/data/repository/pixabay_photo_repository.dart';
import 'package:search_image5/data/use_case/get_top_five_most_viewed_images_use_case.dart';
import 'package:search_image5/ui/detail/detail_screen.dart';
import 'package:search_image5/ui/main/main_screen.dart';
import 'package:search_image5/ui/main/main_view_model.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (_) => MainViewModel(
            GetTopFiveMostViewedImagesUseCase(
              PixabayPhotoRepository(),
            ),
          ),
          child: MainScreen(),
        );
      },
      routes: [
        GoRoute(
          path: 'detail',
          builder: (context, state) {
            return DetailScreen();
          },
        )
      ],
    ),
  ],
);
