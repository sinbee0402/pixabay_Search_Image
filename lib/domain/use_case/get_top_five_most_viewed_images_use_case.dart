import 'package:search_image3/domain/model/photo.dart';
import 'package:search_image3/domain/repository/photo_repository.dart';

class GetTopFiveMostViewedImagesUseCase {
  final PhotoRepository _repository;

  GetTopFiveMostViewedImagesUseCase(this._repository);

  Future<List<Photo>> call(String query) async {
    final photos = await _repository.getPhotos(query);

    // 조회수 (views)순으로 정렬
    photos.sort((a, b) => -a.views.compareTo(b.views));

    return photos.toList();
  }
}
