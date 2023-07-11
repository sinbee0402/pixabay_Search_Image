import 'package:search_image5/data/model/photo.dart';
import 'package:search_image5/data/use_case/get_top_five_most_viewed_images_use_case.dart';

class MainViewModel {
  final GetTopFiveMostViewedImagesUseCase _getTopFiveMostViewedImagesUseCase;

  List<Photo> _photos = [];
  List<Photo> get photos => _photos;

  MainViewModel(this._getTopFiveMostViewedImagesUseCase);

  void fetch(String query) async {
    _photos = await _getTopFiveMostViewedImagesUseCase(query);
  }
}
