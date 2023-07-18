import 'package:search_image5/core/result.dart';
import 'package:search_image5/data/model/photo.dart';
import 'package:search_image5/data/repository/pixabay_photo_repository.dart';

class GetTopFiveMostViewedImagesUseCase {
  final PixabayPhotoRepository _repository;

  GetTopFiveMostViewedImagesUseCase(this._repository);

  Future<Result<List<Photo>>> call(String query) async {
    try {
      final photos = await _repository.getPhotos(query);

      photos.sort((a, b) => -a.views.compareTo(b.views));

      return Result.success(photos.toList());
    } catch (e) {
      return const Result.error('네트워크 에러');
    }
  }
}
