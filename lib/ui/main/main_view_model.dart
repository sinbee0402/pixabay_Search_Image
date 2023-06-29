import 'package:flutter/material.dart';

import 'package:search_image/data/pixabay_api.dart';
import '../../data/model/pixabay.dart';

class MainViewModel with ChangeNotifier {
  final api = PixabayApi();

  List<Pixabay> datas = [];

  Future<void> getImages(String query) async {
    datas = await api.getPixabays(query);
    notifyListeners();
  }
}
