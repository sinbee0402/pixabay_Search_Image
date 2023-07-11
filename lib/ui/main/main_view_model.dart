import 'package:search_image5/data/model/photo.dart';
import 'package:search_image5/data/use_case/get_top_five_most_viewed_images_use_case.dart';
import 'package:search_image5/ui/main/main_state.dart';

class MainViewModel {
  final GetTopFiveMostViewedImagesUseCase _getTopFiveMostViewedImagesUseCase;

  MainState _state = const MainState();
  MainState get state => _state;

  MainViewModel(this._getTopFiveMostViewedImagesUseCase);

  void fetch(String query) async {
    _state = state.copyWith(
      photos: await _getTopFiveMostViewedImagesUseCase(query),
    );
  }
}
