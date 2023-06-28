import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/foundation.dart';

part 'pixabay.g.dart';

@JsonSerializable(explicitToJson: true)
class Pixabay {
  int id;
  String imgUrl;

  Pixabay({required this.id, required this.imgUrl});

  factory Pixabay.fromJson(Map<String, dynamic> json) =>
      _$PixabayFromJson(json);

  Map<String, dynamic> toJson() => _$PixabayToJson(this);
}
