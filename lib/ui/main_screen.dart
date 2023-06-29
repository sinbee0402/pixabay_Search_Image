import 'package:flutter/material.dart';
import 'package:search_image/data/model/pixabay.dart';
import 'package:search_image/data/pixabayApi.dart';
import 'package:search_image/ui/detail_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final api = PixabayApi();

  List<Pixabay> datas = [];

  String query = '';
  final _titleTextController = TextEditingController();

  @override
  void dispose() {
    _titleTextController.dispose();
    super.dispose();
  }

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
            TextField(
              controller: _titleTextController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                hintText: '내용을 입력하세요',
                fillColor: Colors.white70,
                suffixIcon: IconButton(
                    onPressed: () async {
                      query = _titleTextController.text;
                      if (query.isNotEmpty) {
                        datas = await api.getPixabays(query);
                      }
                    },
                    icon: const Icon(Icons.search)),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: FutureBuilder<List<Pixabay>>(
                  future: api.getPixabays(query),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      const Text('알 수 없는 에러');
                    }

                    return GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: datas.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        final data = datas[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailScreen(data: data)),
                            );
                          },
                          child: Hero(
                            tag: '${data.id}',
                            child: Image.network(
                              data.imgUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
