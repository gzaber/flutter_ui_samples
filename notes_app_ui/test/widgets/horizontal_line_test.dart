import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:notes_app_ui/widgets/widgets.dart';

import '../helpers.dart';

void main() {
  group('HorizontalLine', () {
    testWidgets('renders HorizontalLine widget', (tester) async {
      await tester.pumpApp(
        widget: const Scaffold(
          body: HorizontalLine(color: Colors.yellow),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(HorizontalLine), findsOneWidget);
    });
  });
}
