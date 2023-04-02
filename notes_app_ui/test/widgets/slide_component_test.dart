import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:notes_app_ui/widgets/widgets.dart';

import '../helpers.dart';

void main() {
  group('SlideComponent', () {
    testWidgets('renders SlideComponent widget', (tester) async {
      await tester.pumpApp(
        widget: const Scaffold(
          body: SlideComponent(
            fromDirection: AxisDirection.up,
            child: SizedBox(
              width: 20,
              height: 10,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(SlideComponent), findsOneWidget);
    });
  });
}
