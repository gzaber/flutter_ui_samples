import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:furniture_ecommerce_app_ui/models/models.dart';
import 'package:furniture_ecommerce_app_ui/pages/pages.dart';
import 'package:mockingjay/mockingjay.dart';

import '../helpers.dart';

void main() {
  group('ProductPage', () {
    final product = Product.products.first;

    testWidgets('is routable', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(builder: (context) {
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(context, ProductPage.route(product: product));
                },
              ),
            );
          }),
        ),
      );
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      expect(find.byType(ProductPage), findsOneWidget);
    });

    testWidgets('renders error widget when loading image failed',
        (tester) async {
      await tester.pumpApp(ProductPage(product: product));
      await tester.pump();

      expect(
        find.byKey(const Key('productPageProductImageErrorKey')),
        findsOneWidget,
      );
    });

    testWidgets('favorite button can be tapped', (tester) async {
      await tester.pumpApp(ProductPage(product: product));

      await tester.tap(
        find.byKey(const Key('productPageFavoriteButtonKey')),
      );
    });

    testWidgets('ColorItems can be tapped', (tester) async {
      await tester.pumpApp(ProductPage(product: product));

      await tester.tap(
        find.byKey(const Key('productPageFirstColorItemKey')),
      );
      await tester.tap(
        find.byKey(const Key('productPageSecondColorItemKey')),
      );
      await tester.tap(
        find.byKey(const Key('productPageThirdColorItemKey')),
      );
    });

    testWidgets('MoreChairList item can be tapped', (tester) async {
      await tester.pumpApp(ProductPage(product: product));

      await tester.tap(
        find.byKey(const Key('productPageMoreChairListItemKey0')),
      );
    });

    testWidgets('decrement button can be tapped', (tester) async {
      await tester.pumpApp(ProductPage(product: product));

      await tester.tap(
        find.byKey(const Key('productPageDecrementButtonKey')),
      );
    });

    testWidgets('increment button can be tapped', (tester) async {
      await tester.pumpApp(ProductPage(product: product));

      await tester.tap(
        find.byKey(const Key('productPageIncrementButtonKey')),
      );
    });

    testWidgets('add to cart button can be tapped', (tester) async {
      await tester.pumpApp(ProductPage(product: product));

      await tester.tap(
        find.byKey(const Key('productPageAddToCartButtonKey')),
      );
    });

    testWidgets('pops when back button is tapped', (tester) async {
      final navigator = MockNavigator();
      when(() => navigator.pop<void>()).thenAnswer((_) async {});

      await tester.pumpApp(
        MockNavigatorProvider(
          navigator: navigator,
          child: ProductPage(product: product),
        ),
      );

      await tester.tap(find.byIcon(Icons.arrow_back));

      verify(() => navigator.pop<void>()).called(1);
    });
  });
}
