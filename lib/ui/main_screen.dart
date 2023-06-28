import 'package:flutter/material.dart';
import 'package:search_image/data/model/pixabay.dart';
import 'package:search_image/data/pixabayApi.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final api = PixabayApi();

  late List<Pixabay> datas;

  final _titleTextController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Center(child: Text('이미지 검색 앱')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 8),
            TextFormField(
              controller: _titleTextController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                hintText: '내용을 입력하세요',
                fillColor: Colors.white70,
                suffixIcon: GestureDetector(
                  onTap: () async {
                    if (_titleTextController.text.isNotEmpty) {
                      setState(() {
                        isLoading = true;
                      });

                      datas = await api.getPixabays(_titleTextController.text);

                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                  child: const Icon(Icons.search),
                ),
              ),
            ),
            if (isLoading) const CircularProgressIndicator(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: GridView.builder(
                itemCount: datas.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final data = datas[index];
                  return GestureDetector(
                    onTap: () {},
                    child: Hero(
                      tag: '${data.id}',
                      child: Image.network(
                        data.imgUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
