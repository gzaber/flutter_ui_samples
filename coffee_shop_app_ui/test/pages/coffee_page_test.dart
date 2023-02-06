import 'package:coffee_shop_app_ui/models/models.dart';
import 'package:coffee_shop_app_ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

import '../helpers.dart';

void main() {
  group('CoffeePage', () {
    final coffee = coffees.first;

    testWidgets('is routable', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(builder: (context) {
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(context, CoffeePage.route(coffee: coffee));
                },
              ),
            );
          }),
        ),
      );
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      expect(find.byType(CoffeePage), findsOneWidget);
    });

    testWidgets('pops when back button is tapped', (tester) async {
      final navigator = MockNavigator();
      when(() => navigator.pop<void>()).thenAnswer((_) async {});

      await tester.pumpApp(
        MockNavigatorProvider(
          navigator: navigator,
          child: CoffeePage(coffee: coffee),
        ),
      );

      await tester.tap(find.byIcon(Icons.arrow_back));

      verify(() => navigator.pop<void>()).called(1);
    });

    testWidgets('favorite button can be tapped', (tester) async {
      await tester.pumpApp(CoffeePage(coffee: coffee));

      await tester.tap(find.byIcon(Icons.favorite));
    });

    testWidgets('renders error widget when loading image failed',
        (tester) async {
      await tester.pumpApp(CoffeePage(coffee: coffee));
      await tester.pump();

      expect(
        find.byKey(const Key('coffeePageCoffeeImageErrorKey')),
        findsOneWidget,
      );
    });

    testWidgets('coffee SizeItems can be tapped', (tester) async {
      await tester.pumpApp(CoffeePage(coffee: coffee));

      await tester
          .ensureVisible(find.byKey(const Key('coffeePageSizeItemKeyM')));
      await tester.tap(find.byKey(const Key('coffeePageSizeItemKeyM')));
    });

    testWidgets('buy now button can be tapped', (tester) async {
      await tester.pumpApp(CoffeePage(coffee: coffee));

      await tester
          .ensureVisible(find.byKey(const Key('coffeePageBuyNowButtonKey')));
      await tester.tap(find.byKey(const Key('coffeePageBuyNowButtonKey')));
    });
  });
}
