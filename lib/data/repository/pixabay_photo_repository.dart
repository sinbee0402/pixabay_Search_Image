import 'package:search_image5/core/result.dart';
import 'package:search_image5/data/api/pixabay_api.dart';
import 'package:search_image5/data/model/photo.dart';

class PixabayPhotoRepository {
  final _api = PixabayApi();

  Future<Result<List<Photo>>> getPhotos(String query) async {
    try {
      final photos = await _api.getPixabays(query);

      if (photos == null) {
        return const Result.error('데이터가 없습니다.');
      }

      return Result.success(photos!.toList());
    } catch (e) {
      return const Result.error('네트워크 에러');
    }
  }
}
