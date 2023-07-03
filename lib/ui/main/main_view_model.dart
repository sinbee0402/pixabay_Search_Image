import 'package:flutter/cupertino.dart';
import 'package:search_image2/data/api/pixabay_api.dart';
import 'package:search_image2/data/model/photo.dart';

class MainViewModel with ChangeNotifier {
  final _api = PixabayApi();

  List<Photo>? _photos = [];
  List<Photo>? get photos => _photos;

  void fetchImages(String query) async {
    _photos = await _api.getPixabays(query);
    _photos ?? [];

    notifyListeners();
  }
}
