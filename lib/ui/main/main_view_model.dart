import 'package:flutter/cupertino.dart';
import 'package:search_image5/data/use_case/get_top_five_most_viewed_images_use_case.dart';
import 'package:search_image5/ui/main/main_state.dart';

class MainViewModel with ChangeNotifier {
  final GetTopFiveMostViewedImagesUseCase _getTopFiveMostViewedImagesUseCase;

  MainState _state = const MainState();
  MainState get state => _state;

  MainViewModel(this._getTopFiveMostViewedImagesUseCase);

  void fetch(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
      isLoading: false,
      photos: await _getTopFiveMostViewedImagesUseCase(query),
    );
    notifyListeners();
  }
}
