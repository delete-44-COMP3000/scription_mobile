import 'package:flutter_test/flutter_test.dart';
import 'package:scription_mobile/notebooks/index.dart';
import 'package:flutter/material.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:scription_mobile/http-common.dart';

void main() {
  group('Notebooks index widget', () {
    DioAdapter dioAdapter;

    final notebooks = [
      {
        'id': 1,
        'name': 'Notebook 1',
        'summary': 'Notebook 1 Summary',
      },
      {
        'id': 2,
        'name': 'Notebook 2',
      },
      {
        'id': 3,
        'name': 'Notebook 3',
        'summary': 'Notebook 3 summary',
      }
    ];

    setUpAll(() {
      // Set up mock dio adapter before all tests
      dioAdapter = DioAdapter();

      Http().dio.httpClientAdapter = dioAdapter;
    });

    testWidgets('Rendering widgets correctly', (WidgetTester tester) async {
      dioAdapter.onGet('/notebooks').reply(200, notebooks);

      final widget = new MaterialApp(home: Notebooks());

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.text('Notebook 1'), findsOneWidget);
    });
  });
}