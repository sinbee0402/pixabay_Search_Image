import 'package:flutter/material.dart';
import 'package:search_image3/data/repository/pixabay_photo_repository_impl.dart';

class MainViewModel with ChangeNotifier {
  final PixabayPhotoRepositoryImpl _repositoryImpl;

  MainViewModel(this._repositoryImpl);

  void fetchImages(String query) async {
    await _repositoryImpl.getPhotos(query);
    notifyListeners();
  }
}
