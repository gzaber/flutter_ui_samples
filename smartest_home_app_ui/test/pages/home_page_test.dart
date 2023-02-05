import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:smartest_home_app_ui/models/models.dart';
import 'package:smartest_home_app_ui/pages/pages.dart';

import '../helpers.dart';

void main() {
  group('HomePage', () {
    testWidgets('menu button can be tapped', (tester) async {
      await tester.pumpApp(const HomePage());

      await tester.tap(find.byIcon(Icons.menu));
    });

    testWidgets('notification button can be tapped', (tester) async {
      await tester.pumpApp(const HomePage());

      await tester.tap(find.byIcon(Icons.notifications_outlined));
    });

    testWidgets('scene header button can be tapped', (tester) async {
      await tester.pumpApp(const HomePage());

      await tester.tap(find.byKey(const Key('homePageSceneHeaderButtonKey')));
    });

    testWidgets('SceneItem can be tapped', (tester) async {
      await tester.pumpApp(const HomePage());

      await tester.tap(find.byKey(const Key('homePageSceneItemKey0')));
    });

    testWidgets('renders error widget when loading image failed',
        (tester) async {
      await tester.pumpApp(const HomePage());
      await tester.pump();

      expect(
          find.byKey(
              Key('homePageRoomItemErorrKey${roomsList.first.imageUrl}')),
          findsOneWidget);
    });

    testWidgets('navigates to RoomPage when RoomItem is tapped',
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
        find.byKey(const Key('homePageRoomItemKey0')),
      );
      await tester.tap(
        find.byKey(const Key('homePageRoomItemKey0')),
      );

      verify(
        () => navigator
            .push<void>(any(that: isRoute<void>(whereName: equals('/room')))),
      ).called(1);
    });
  });
}
