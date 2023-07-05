import 'package:flutter/cupertino.dart';
import 'package:search_image2/data/api/pixabay_api.dart';
import 'package:search_image2/ui/main/main_state.dart';

class MainViewModel with ChangeNotifier {
  final _api = PixabayApi();

  MainState _state = MainState(photos: []);
  MainState get state => _state;

  void fetchImages(String query) async {
    final photos = await _api.getPixabays(query);

    _state = state.copyWith(
      photos: photos,
    );

    notifyListeners();
  }
}
