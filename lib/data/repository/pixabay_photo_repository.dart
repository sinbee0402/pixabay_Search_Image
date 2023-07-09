// 구현
import 'package:search_image4/core/result.dart';
import 'package:search_image4/data/api/pixabay_api.dart';
import 'package:search_image4/domain/model/photo.dart';
import 'package:search_image4/domain/repository/photo_repository.dart';

class PixabayPhotoRepository implements PhotoRepository {
  final _api = PixabayApi();

  @override
  Future<Result<List<Photo>>> getPhotos(String query) async {
    try {
      final photos = await _api.getPixabays(query);

      if (photos == null) {
        return const Result.error('데이터가 없습니다.');
      }
      return Result.success(photos.toList());
    } catch (e) {
      return const Result.error('네트워크 에러');
    }
  }
}
