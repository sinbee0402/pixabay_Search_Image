import 'package:search_image4/domain/model/photo.dart';
import 'package:search_image4/domain/repository/photo_repository.dart';

class GetTopFiveMostViewedImagesUseCase implements UseCase {
  final PhotoRepository _repository;

  GetTopFiveMostViewedImagesUseCase(this._repository);

  @override
  Future<List<Photo>> call(String query) async {
    final photos = await _repository.getPhotos(query);

    photos.sort((a, b) => -a.views.compareTo(b.views));

    return photos.toList();
  }
}

abstract interface class UseCase {
  Future<List<Photo>> call(String query);
}
