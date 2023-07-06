import 'package:search_image3/domain/model/photo.dart';
import 'package:search_image3/domain/repository/photo_repository.dart';

class GetTopFiveMostViewedImagesUseCase {
  final PhotoRepository _repository;

  GetTopFiveMostViewedImagesUseCase(this._repository);

  // call 혹은 excute 사용 -> call은 메서드를 직접 호출안해도 되지만, excute는 직접 명시(호출)해줘야한다.
  Future<List<Photo>> excute(String query) async {
    final photos = await _repository.getPhotos(query);

    // 조회수 (views)순으로 정렬
    photos.sort((a, b) => -a.views.compareTo(b.views));

    return photos.toList();
  }
}

abstract interface class UseCase {
  // 협업을 한다면 use_case 룰을 정해야 한다.
}
