import 'package:flutter/material.dart';

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
                  onPressed: () {
                    print(textController.text);
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
                //itemCount: ,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // router 이동
                    },
                    child: Hero(
                      tag: '',
                      child: Image.network(
                        '',
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
