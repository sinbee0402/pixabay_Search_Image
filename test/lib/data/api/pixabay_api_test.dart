import 'package:flutter_test/flutter_test.dart';
import 'package:search_image1/data/api/pixabay_api.dart';

void main() {
  test('pixabay api test', () async {
    final api = PixabayApi();

    final dto = await api.getPixabays('apple');

    expect(dto.total, 9263);
  });
}
