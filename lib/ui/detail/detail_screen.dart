import 'package:flutter/material.dart';
import 'package:search_image3/data/model/photo.dart';

class DetailScreen extends StatelessWidget {
  final Photo data;

  const DetailScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Hero(
        tag: '${data.id}',
        child: Center(
          child: Image.network(
            data.url,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
