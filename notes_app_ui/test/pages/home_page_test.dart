import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:notes_app_ui/models/models.dart';
import 'package:notes_app_ui/notifiers/notifiers.dart';
import 'package:notes_app_ui/pages/pages.dart';

import '../helpers.dart';

void main() {
  group('HomePage', () {
    late CategoryNotifier categoryNotifier;

    setUp(() {
      categoryNotifier = CategoryNotifier();
    });

    testWidgets('add button can be tapped', (tester) async {
      await tester.pumpApp(
        widget: const HomePage(),
        categoryNotifier: categoryNotifier,
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('homePageAddButtonKey')));
    });

    testWidgets('selects category when category item is tapped',
        (tester) async {
      await tester.pumpApp(
        widget: const HomePage(),
        categoryNotifier: categoryNotifier,
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('homePageCategoryItemKey0')));

      expect(categoryNotifier.categoryName, categories.first.name);
    });

    testWidgets(
        'clears category when category item is tapped two times in a row',
        (tester) async {
      await tester.pumpApp(
        widget: const HomePage(),
        categoryNotifier: categoryNotifier,
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('homePageCategoryItemKey0')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('homePageCategoryItemKey0')));

      expect(categoryNotifier.categoryName, isEmpty);
    });

    testWidgets('selects another category when another category item is tapped',
        (tester) async {
      await tester.pumpApp(
        widget: const HomePage(),
        categoryNotifier: categoryNotifier,
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('homePageCategoryItemKey0')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('homePageCategoryItemKey1')));
      await tester.pumpAndSettle();

      expect(categoryNotifier.categoryName, categories[1].name);
    });

    testWidgets('navigates to NotePage when note item is tapped',
        (tester) async {
      final navigator = MockNavigator();
      when(() => navigator.push<void>(any())).thenAnswer((_) async {});

      await tester.pumpApp(
        widget: MockNavigatorProvider(
          navigator: navigator,
          child: const HomePage(),
        ),
        categoryNotifier: categoryNotifier,
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('homePageNoteItemKey0')));

      verify(
        () => navigator
            .push<void>(any(that: isRoute<void>(whereName: equals('/note')))),
      ).called(1);
    });
  });
}
