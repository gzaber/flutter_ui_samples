import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:notes_app_ui/models/models.dart';
import 'package:notes_app_ui/pages/pages.dart';

import '../helpers.dart';

void main() {
  group('NotePage', () {
    final note = notes.first;

    testWidgets('is routable', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(builder: (context) {
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(context, NotePage.route(note: note));
                },
              ),
            );
          }),
        ),
      );
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      expect(find.byType(NotePage), findsOneWidget);
    });

    testWidgets('pops when back button is tapped', (tester) async {
      final navigator = MockNavigator();
      when(() => navigator.pop<void>()).thenAnswer((_) async {});

      await tester.pumpApp(
        widget: MockNavigatorProvider(
          navigator: navigator,
          child: NotePage(note: note),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.arrow_back));

      verify(() => navigator.pop<void>()).called(1);
    });

    testWidgets('todo item can be tapped', (tester) async {
      await tester.pumpApp(widget: NotePage(note: note));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('notePageTodoItemKey0')));
    });
  });
}
