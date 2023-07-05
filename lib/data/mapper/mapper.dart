import 'package:search_image3/data/dto/pixabay_result_dto.dart';
import 'package:search_image3/data/model/photo.dart';

extension ToPhoto on Hits {
  Photo toPhoto() {
    return Photo(
      id: id ?? 0,
      url: largeImageURL ?? '',
    );
  }
}
