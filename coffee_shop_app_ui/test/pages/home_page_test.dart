import 'package:coffee_shop_app_ui/models/models.dart';
import 'package:coffee_shop_app_ui/pages/pages.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

import '../helpers.dart';

void main() {
  group('HomePage', () {
    testWidgets('menu button can be tapped', (tester) async {
      await tester.pumpApp(const HomePage());

      await tester.tap(find.byKey(const Key('homePageMenuButtonKey')));
    });

    testWidgets('profile button can be tapped', (tester) async {
      await tester.pumpApp(const HomePage());

      await tester.tap(find.byKey(const Key('homePageProfileButtonKey')));
    });

    testWidgets('CoffeeTypeItem can be tapped', (tester) async {
      await tester.pumpApp(const HomePage());

      await tester.tap(find.byKey(const Key('homePageCoffeeTypeItemKey1')));
    });

    testWidgets('custom NavBar item can be tapped', (tester) async {
      await tester.pumpApp(const HomePage());

      await tester.tap(
        find.byKey(const Key('homePageCustomNavBarItemKey1')),
      );
    });

    testWidgets('renders error widget when loading image failed',
        (tester) async {
      await tester.pumpApp(const HomePage());
      await tester.pump();

      expect(
          find.byKey(
              Key('homePageImageContainerErrorKey${coffees.first.imageUrl}')),
          findsOneWidget);
    });

    testWidgets('navigates to CoffeePage when CoffeeItem is tapped',
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
        find.byKey(const Key('homePageCoffeeItemKey1')),
      );

      verify(
        () => navigator
            .push<void>(any(that: isRoute<void>(whereName: equals('/coffee')))),
      ).called(1);
    });
  });
}
