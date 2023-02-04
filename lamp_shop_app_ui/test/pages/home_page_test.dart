import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lamp_shop_app_ui/models/models.dart';
import 'package:lamp_shop_app_ui/pages/pages.dart';
import 'package:mockingjay/mockingjay.dart';

import '../helpers.dart';

void main() {
  group('HomePage', () {
    testWidgets('renders error widget when loading image failed',
        (tester) async {
      await tester.pumpApp(const HomePage());
      await tester.pump();

      expect(find.byKey(const Key('homePageHeaderError')), findsOneWidget);
    });

    testWidgets('TextButton can be tapped', (tester) async {
      await tester.pumpApp(const HomePage());

      await tester.ensureVisible(
        find.byKey(const Key('homePageHeaderTextButtonKey')),
      );
      await tester.tap(
        find.byKey(const Key('homePageHeaderTextButtonKey')),
      );
    });

    testWidgets('AddItemButton can be tapped', (tester) async {
      await tester.pumpApp(const HomePage());

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

    testWidgets('BottomNavigationBarItem icon can be tapped', (tester) async {
      await tester.pumpApp(const HomePage());

      await tester.tap(find.byIcon(Icons.home_outlined));
    });

    testWidgets('navigates to DetailsPage when item image is tapped',
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

      await tester.ensureVisible(
        find.byKey(
          Key('homePageGridViewItem${Lamp.lamps.first.imageUrl}'),
        ),
      );
      await tester.tap(
        find.byKey(
          Key('homePageGridViewItem${Lamp.lamps.first.imageUrl}'),
        ),
      );

      verify(
        () => navigator.push<void>(
            any(that: isRoute<void>(whereName: equals('/details')))),
      ).called(1);
    });
  });
}
