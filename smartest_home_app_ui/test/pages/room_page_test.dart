import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:smartest_home_app_ui/models/models.dart';
import 'package:smartest_home_app_ui/pages/pages.dart';

import '../helpers.dart';

void main() {
  group('RoomPage', () {
    final room = roomsList.first;

    testWidgets('is routable', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(builder: (context) {
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(context, RoomPage.route(room: room));
                },
              ),
            );
          }),
        ),
      );
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      expect(find.byType(RoomPage), findsOneWidget);
    });

    testWidgets('pops when back button is tapped', (tester) async {
      final navigator = MockNavigator();
      when(() => navigator.pop<void>()).thenAnswer((_) async {});

      await tester.pumpApp(
        MockNavigatorProvider(
          navigator: navigator,
          child: RoomPage(room: room),
        ),
      );

      await tester.tap(find.byIcon(Icons.arrow_back));

      verify(() => navigator.pop<void>()).called(1);
    });

    testWidgets('token button can be tapped', (tester) async {
      await tester.pumpApp(RoomPage(room: room));

      await tester.tap(find.byIcon(Icons.token_outlined));
    });

    testWidgets('devices header button can be tapped', (tester) async {
      await tester.pumpApp(RoomPage(room: room));

      await tester.tap(find.byKey(const Key('roomPageDevicesHeaderButtonKey')));
    });

    testWidgets('TurnOffButton can be tapped', (tester) async {
      await tester.pumpApp(RoomPage(room: room));

      await tester
          .ensureVisible(find.byKey(const Key('roomPageTurnOffButton')));
      await tester.tap(find.byKey(const Key('roomPageTurnOffButton')));
    });

    testWidgets('navigates to LightPage when DeviceItem is tapped',
        (tester) async {
      final navigator = MockNavigator();
      when(() => navigator.push<void>(any())).thenAnswer((_) async {});

      await tester.pumpApp(
        MockNavigatorProvider(
          navigator: navigator,
          child: RoomPage(room: room),
        ),
      );
      await tester.pump();

      await tester.tap(
        find.byKey(Key('roomPageDeviceItemKey${DeviceType.light}')),
      );

      verify(
        () => navigator
            .push<void>(any(that: isRoute<void>(whereName: equals('/light')))),
      ).called(1);
    });
  });
}
