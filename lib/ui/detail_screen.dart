import 'package:flutter/material.dart';
import 'package:search_image/data/model/pixabay.dart';
import 'package:search_image/data/pixabayApi.dart';

class DetailScreen extends StatelessWidget {
  final Pixabay pixabay;

  const DetailScreen({Key? key, required this.pixabay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final api = PixabayApi();

    return Scaffold(
      appBar: AppBar(),
      body: Hero(
        tag: '${pixabay.id}',
        child: Center(
          child: Image.network(
            pixabay.imgUrl,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
