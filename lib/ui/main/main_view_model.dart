import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import '../../data/model/pixabay.dart';

class MainViewModel {
  final apiKey = '37726328-4a2b1a654b17d6bad1ec74dba';
  final pixabayUrl = 'https://pixabay.com/api/';
  final _titleTextController = TextEditingController();

  TextEditingController get titleTextController => _titleTextController;

  Future<List<Pixabay>> getPixabays(String query) async {
    final response = await http
        .get(Uri.parse('?key=$apiKey$pixabayUrl&q=$query&image_type=all'));

    Iterable jsonArray = jsonDecode(response.body)['hits'];

    return jsonArray.map((e) => Pixabay.fromJson(e)).toList();
  }
}
