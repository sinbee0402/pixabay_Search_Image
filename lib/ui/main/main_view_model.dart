import 'package:flutter/cupertino.dart';
import 'package:search_image2/data/api/pixabay_api.dart';
import 'package:search_image2/ui/main/main_state.dart';

class MainViewModel with ChangeNotifier {
  final _api = PixabayApi();

  final MainState _state = MainState();
  MainState get state => _state;

  void fetchImages(String query) async {
    _state.photos = await _api.getPixabays(query);

    notifyListeners();
  }
}
