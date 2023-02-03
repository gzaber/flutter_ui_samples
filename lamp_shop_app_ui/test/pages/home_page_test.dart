import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lamp_shop_app_ui/models/models.dart';
import 'package:lamp_shop_app_ui/pages/pages.dart';
import 'package:mockingjay/mockingjay.dart';

extension WidgetTesterX on WidgetTester {
  Future<void> pumpApp({MockNavigator? navigator}) {
    return pumpWidget(
      MaterialApp(
        home: navigator == null
            ? const HomePage()
            : MockNavigatorProvider(
                navigator: navigator,
                child: const HomePage(),
              ),
      ),
    );
  }
}

void main() {
  group('HomePage', () {
    testWidgets('renders light icon and shop name', (tester) async {
      await tester.pumpApp();

      expect(find.byIcon(Icons.light), findsOneWidget);
      expect(find.text('Moli'), findsOneWidget);
    });

    testWidgets('renders TextButton with text', (tester) async {
      await tester.pumpApp();

      await tester.ensureVisible(
        find.descendant(
          of: find.byType(TextButton),
          matching: find.text('Explore'),
        ),
      );
      await tester.tap(
        find.descendant(
          of: find.byType(TextButton),
          matching: find.text('Explore'),
        ),
      );

      expect(
        find.descendant(
            of: find.byType(TextButton), matching: find.text('Explore')),
        findsOneWidget,
      );
    });

    testWidgets('renders intro text', (tester) async {
      await tester.pumpApp();

      expect(find.text('The Most\nUnique Lights'), findsOneWidget);
      expect(find.text('For Daily Living.'), findsOneWidget);
    });

    testWidgets('renders grid view title', (tester) async {
      await tester.pumpApp();

      expect(find.text('New Arrivals'), findsOneWidget);
    });

    testWidgets('renders header background', (tester) async {
      await tester.pumpApp();

      expect(
        find.byKey(const Key('homePageHeaderBackgroundKey')),
        findsOneWidget,
      );
    });

    testWidgets('renders grid view item background', (tester) async {
      await tester.pumpApp();

      for (final lamp in Lamp.lamps) {
        expect(
          find.byKey(Key('homePageGridViewItemBackgroundKey${lamp.imageUrl}')),
          findsOneWidget,
        );
      }
    });

    testWidgets('add item button can be tapped', (tester) async {
      await tester.pumpApp();

      await tester.ensureVisible(
        find.byKey(
          Key('homePageGridViewItemAddKey${Lamp.lamps.first.imageUrl}'),
        ),
      );
      await tester.tap(
        find.byKey(
          Key('homePageGridViewItemAddKey${Lamp.lamps.first.imageUrl}'),
        ),
      );
    });

    testWidgets('renders BottomNavigationBar with icons', (tester) async {
      await tester.pumpApp();

      expect(find.byType(BottomNavigationBar), findsOneWidget);
      expect(
        find.descendant(
            of: find.byType(BottomNavigationBar),
            matching: find.byIcon(Icons.home_outlined)),
        findsOneWidget,
      );
      expect(
        find.descendant(
            of: find.byType(BottomNavigationBar),
            matching: find.byIcon(Icons.widgets_outlined)),
        findsOneWidget,
      );
      expect(
        find.descendant(
            of: find.byType(BottomNavigationBar),
            matching: find.byIcon(Icons.search)),
        findsOneWidget,
      );
      expect(
        find.descendant(
            of: find.byType(BottomNavigationBar),
            matching: find.byIcon(Icons.bookmarks_outlined)),
        findsOneWidget,
      );
      expect(
        find.descendant(
            of: find.byType(BottomNavigationBar),
            matching: find.byIcon(Icons.shopping_cart_outlined)),
        findsOneWidget,
      );
    });

    testWidgets('navigation icon can be tapped', (tester) async {
      await tester.pumpApp();

      await tester.tap(find.byIcon(Icons.home_outlined));
    });

    testWidgets('renders error widget when loading image failed',
        (tester) async {
      await tester.pumpApp();
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('homePageHeaderError')), findsOneWidget);
    });

    testWidgets('navigates to DetailsPage when item image is tapped',
        (tester) async {
      final navigator = MockNavigator();
      when(() => navigator.push<void>(any())).thenAnswer((_) async {});

      await tester.pumpApp(navigator: navigator);
      await tester.pump();

      await tester.ensureVisible(
        find.byKey(
          Key('homePageGridViewItemInkWellKey${Lamp.lamps.first.imageUrl}'),
        ),
      );
      await tester.tap(
        find.byKey(
          Key('homePageGridViewItemInkWellKey${Lamp.lamps.first.imageUrl}'),
        ),
      );

      verify(
        () => navigator.push<void>(
            any(that: isRoute<void>(whereName: equals('/details')))),
      ).called(1);
    });
  });
}
