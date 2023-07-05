import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:search_image3/data/model/photo.dart';

part 'main_state.freezed.dart';

part 'main_state.g.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    @Default([]) List<Photo> photos,
  }) = _MainState;

  factory MainState.fromJson(Map<String, Object?> json) =>
      _$MainStateFromJson(json);
}
