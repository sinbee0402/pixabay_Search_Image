import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:search_image/data/model/pixabay.dart';

class PixabayApi {
  static const apiKey = '37726328-4a2b1a654b17d6bad1ec74dba';
  static const pixabayUrl = 'https://pixabay.com/api/?key=$apiKey';

  Future<Pixabay> getPixabay() async {
    final response = await http.get(Uri.parse('$pixabayUrl$apiKey'));

    return Pixabay.fromJson(jsonDecode(response.body));
  }

  Future<List<Pixabay>> getPixabays() async {
    final response = await http.get(Uri.parse(pixabayUrl));

    Iterable jsonArray = jsonDecode(response.body);

    return jsonArray.map((e) => Pixabay.fromJson(e)).toList();
  }
}
