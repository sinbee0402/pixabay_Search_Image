import 'package:search_image1/data/dto/pixabay_result_dto.dart';
import 'package:search_image1/data/model/photo.dart';

extension ToPhoto on Hits {
  Photo toPhoto() {
    return Photo(
      id: id ?? 0,
      url: webformatURL ?? '',
      tags: tags ?? '',
      views: views ?? 0,
    );
  }
}
