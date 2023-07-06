// 구현
import 'package:search_image4/data/api/pixabay_api.dart';
import 'package:search_image4/domain/model/photo.dart';
import 'package:search_image4/domain/repository/photo_repository.dart';

class PixabayPhotoRepository implements PhotoRepository {
  final _api = PixabayApi();

  @override
  Future<List<Photo>> getPhotos(String query) async {
    final photos = await _api.getPixabays(query);

    if (photos == null) {
      return [];
    }

    return photos!.toList();
  }
}
