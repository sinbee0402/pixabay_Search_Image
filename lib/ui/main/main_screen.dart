import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:search_image5/ui/main/main_view_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('이미지 검색 앱'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: '내용을 입력하세요',
                hintStyle: TextStyle(color: Colors.grey[800]),
                suffixIcon: IconButton(
                  onPressed: () async {
                    viewModel.fetch(textController.text);
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
              onFieldSubmitted: (value) {
                print(value);
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: state.photos.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                itemBuilder: (context, index) {
                  final photo = state.photos[index];
                  return GestureDetector(
                    onTap: () {
                      context.push('/detail', extra: photo);
                    },
                    child: Hero(
                      tag: '${photo.id}',
                      child: Image.network(
                        photo.largeImageURL,
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
