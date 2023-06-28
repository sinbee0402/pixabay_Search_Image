import 'package:flutter/material.dart';
import 'package:search_image/data/model/pixabay.dart';
import 'package:search_image/data/pixabayApi.dart';

class DetailScreen extends StatelessWidget {
  final Pixabay data;

  const DetailScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Hero(
        tag: '${data.id}',
        child: Center(
          child: Image.network(
            data.imgUrl,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
