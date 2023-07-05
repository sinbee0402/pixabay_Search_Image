import 'package:flutter/material.dart';
import 'package:search_image3/data/model/photo.dart';

class DetailScreen extends StatelessWidget {
  final Photo photo;

  const DetailScreen({
    Key? key,
    required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Hero(
        tag: '${photo.id}',
        child: Center(
          child: Image.network(
            photo.url,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
