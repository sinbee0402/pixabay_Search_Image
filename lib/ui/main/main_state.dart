import 'package:search_image2/data/model/photo.dart';

class MainState {
  final List<Photo> photos;

  MainState({
    required this.photos,
  });

  MainState copyWith({
    List<Photo>? photos,
  }) {
    return MainState(
      photos: photos ?? this.photos,
    );
  }
}
