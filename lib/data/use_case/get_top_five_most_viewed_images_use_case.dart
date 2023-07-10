import 'package:search_image5/data/model/photo.dart';
import 'package:search_image5/data/repository/pixabay_photo_repository.dart';

class GetTopFiveMostViewedImagesUseCase {
  final PixabayPhotoRepository _repository;

  GetTopFiveMostViewedImagesUseCase(this._repository);

  Future<List<Photo>> call(String query) async {
    final photos = await _repository.getPhotos(query);

    photos.sort((a, b) => -a.views.compareTo(b.views));

    return photos.toList();
  }
}
