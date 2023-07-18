import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:search_image5/core/result.dart';
import 'package:search_image5/data/use_case/get_top_five_most_viewed_images_use_case.dart';
import 'package:search_image5/ui/main/main_state.dart';
import 'package:search_image5/ui/main/main_ui_event.dart';

class MainViewModel with ChangeNotifier {
  final GetTopFiveMostViewedImagesUseCase _getTopFiveMostViewedImagesUseCase;

  final _eventController = StreamController<MainUiEvent>();

  Stream<MainUiEvent> get eventStream => _eventController.stream;

  MainState _state = const MainState();
  MainState get state => _state;

  MainViewModel(this._getTopFiveMostViewedImagesUseCase);

  void fetch(String query) async {
    if (query.isEmpty) {
      _eventController.add(const ShowSnackBar('검색어가 없습니다'));
      return;
    }

    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _getTopFiveMostViewedImagesUseCase(query);

    switch (result) {
      case Success(:final data):
        _state = state.copyWith(
          isLoading: false,
          photos: data,
        );
        notifyListeners();
        _eventController.add(const EndLoading());

      case Error(:final e):
        _eventController.add(ShowSnackBar(e));
    }
  }
}
