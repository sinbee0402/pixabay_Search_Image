import 'package:search_image3/data/api/pixabay_api.dart';
import 'package:search_image3/data/mapper/mapper.dart';
import 'package:search_image3/data/model/photo.dart';
import 'package:search_image3/data/repository/photo_repository.dart';

class PixabayPhotoRepositoryImpl implements PhotoRepository {
  final _api = PixabayApi();

  @override
  Future<List<Photo>> getPhotos(String query) async {
    final resultDto = await _api.getPixabays(query);

    if (resultDto.hits == null) {
      return [];
    }

    return resultDto.hits!.map((e) => e.toPhoto()).toList();
  }
}
