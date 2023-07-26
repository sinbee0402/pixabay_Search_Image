import 'package:injectable/injectable.dart';
import 'package:search_image5/data/api/pixabay_api.dart';
import 'package:search_image5/data/model/photo.dart';

@singleton
class PixabayPhotoRepository {
  final _api = PixabayApi();

  Future<List<Photo>> getPhotos(String query) async {
    final photos = await _api.getPixabays(query);

    if (photos == null) {
      return [];
    }

    return photos!.toList();
  }
}