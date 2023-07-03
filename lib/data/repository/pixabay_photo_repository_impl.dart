import 'package:search_image1/data/api/pixabay_api.dart';
import 'package:search_image1/data/mapper/photo_mapper.dart';
import 'package:search_image1/data/model/photo.dart';
import 'package:search_image1/data/repository/photo_repository.dart';

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
