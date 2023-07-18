import 'package:search_image5/core/result.dart';
import 'package:search_image5/data/model/photo.dart';
import 'package:search_image5/data/repository/pixabay_photo_repository.dart';

class GetTopFiveMostViewedImagesUseCase {
  final PixabayPhotoRepository _repository;

  GetTopFiveMostViewedImagesUseCase(this._repository);

  Future<Result<List<Photo>>> call(String query) async {
    final result = await _repository.getPhotos(query);

    switch (result) {
      case Success(:final data):
        data.sort((a, b) => -a.views.compareTo(b.views));

        return Result.success(data.toList());

      case Error():
        return result;
    }
  }
}
