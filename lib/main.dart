import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_image1/data/repository/pixabay_photo_repository_impl.dart';
import 'package:search_image1/ui/main/main_screen.dart';
import 'package:search_image1/ui/main/main_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainViewModel(PixabayPhotoRepositoryImpl()),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
