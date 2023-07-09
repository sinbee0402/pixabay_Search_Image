import 'package:search_image4/core/result.dart';
import 'package:search_image4/domain/model/photo.dart';
import 'package:search_image4/domain/repository/photo_repository.dart';

class GetTopFiveMostViewedImagesUseCase
    implements UseCase<String, List<Photo>> {
  final PhotoRepository _repository;

  GetTopFiveMostViewedImagesUseCase(this._repository);

  @override
  Future<Result<List<Photo>>> call(String query) async {
    final result = await _repository.getPhotos(query);

    switch (result) {
      case Success(:final data):
        data.sort((a, b) => -a.views.compareTo(b.views));
        return Result.success(data.toList());
      case Error():
        return result;
    }
    return result;
  }
}

abstract interface class UseCase<I, O> {
  Future<Result<O>> call(I input);
}
