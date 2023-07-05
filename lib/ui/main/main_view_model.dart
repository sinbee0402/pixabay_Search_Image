import 'package:flutter/material.dart';
import 'package:search_image3/data/repository/pixabay_photo_repository_impl.dart';
import 'package:search_image3/ui/main/main_state.dart';

class MainViewModel with ChangeNotifier {
  final PixabayPhotoRepositoryImpl _repositoryImpl;

  MainViewModel(this._repositoryImpl);

  MainState _state = const MainState();
  MainState get state => _state;

  void fetchImages(String query) async {
    final photos = await _repositoryImpl.getPhotos(query);

    _state = state.copyWith(
      photos: photos,
    );
    notifyListeners();
  }
}
