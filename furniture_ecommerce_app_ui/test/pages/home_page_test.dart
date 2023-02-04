import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:furniture_ecommerce_app_ui/models/models.dart';
import 'package:furniture_ecommerce_app_ui/pages/pages.dart';
import 'package:mockingjay/mockingjay.dart';

import '../helpers.dart';

void main() {
  group('HomePage', () {
    testWidgets('is routable', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(builder: (context) {
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(context, HomePage.route());
                },
              ),
            );
          }),
        ),
      );
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('renders error widget when loading image failed',
        (tester) async {
      await tester.pumpApp(const HomePage());
      await tester.pump();

      expect(
        find.byKey(
            Key('homePageImageErrorKey${Product.products.first.imageUrl}')),
        findsOneWidget,
      );
    });

    testWidgets('search button can be tapped', (tester) async {
      await tester.pumpApp(const HomePage());

      await tester.tap(find.byKey(const Key('homePageSearchButtonKey')));
    });

    testWidgets('category button can be tapped', (tester) async {
      await tester.pumpApp(const HomePage());

      await tester.tap(
        find.byKey(
          Key('homePageCategoryButtonKey${Category.categories.first.name}'),
        ),
      );
    });

    testWidgets('add product button can be tapped', (tester) async {
      await tester.pumpApp(const HomePage());

      await tester.tap(
        find.byKey(
          Key('homePageAddProductButtonKey${Product.products.first.imageUrl}'),
        ),
      );
    });

    testWidgets('favorite button can be tapped', (tester) async {
      await tester.pumpApp(const HomePage());

      await tester.tap(
        find.byKey(
          Key('homePageFavoriteButtonKey${Product.products.first.imageUrl}'),
        ),
      );
    });

    testWidgets('BottomNavigationBarItem icon can be tapped', (tester) async {
      await tester.pumpApp(const HomePage());

      await tester.tap(find.byIcon(Icons.shopping_cart_outlined));
    });

    testWidgets('navigates to HomePage when item image is tapped',
        (tester) async {
      final navigator = MockNavigator();
      when(() => navigator.push<void>(any())).thenAnswer((_) async {});

      await tester.pumpApp(
        MockNavigatorProvider(
          navigator: navigator,
          child: const HomePage(),
        ),
      );
      await tester.pump();

      await tester.tap(
        find.byKey(
            Key('homePageProductCardKey${Product.products.first.imageUrl}')),
      );

      verify(
        () => navigator.push<void>(
            any(that: isRoute<void>(whereName: equals('/product')))),
      ).called(1);
    });
  });
}
