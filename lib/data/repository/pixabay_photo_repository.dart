import 'package:search_image5/data/api/pixabay_api.dart';
import 'package:search_image5/data/model/photo.dart';

class PixabayPhotoRepository {
  final _api = PixabayApi();

  Future<List<Photo>> fetch(String query) async {
    final photos = await _api.getPixabays(query);

    return photos.toList();
  }
}
