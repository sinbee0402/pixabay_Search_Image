import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:search_image5/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('banana Test', () {
    testWidgets('banana', (tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.enterText(find.byType(TextFormField), 'banana');

      //await tester.pump();

      //expect(find.text('banana'), findsOneWidget);
    });
  });
}
