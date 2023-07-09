// 추상
import 'package:search_image4/core/result.dart';
import 'package:search_image4/domain/model/photo.dart';

abstract interface class PhotoRepository {
  Future<Result<List<Photo>>> getPhotos(String query);
}
