import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:smartest_home_app_ui/models/models.dart';
import 'package:smartest_home_app_ui/pages/pages.dart';

import '../helpers.dart';

void main() {
  group('LightPage', () {
    final device = roomsList.first.devices.first;

    testWidgets('is routable', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(builder: (context) {
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(context, LightPage.route(device: device));
                },
              ),
            );
          }),
        ),
      );
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      expect(find.byType(LightPage), findsOneWidget);
    });

    testWidgets('pops when back button is tapped', (tester) async {
      final navigator = MockNavigator();
      when(() => navigator.pop<void>()).thenAnswer((_) async {});

      await tester.pumpApp(
        MockNavigatorProvider(
          navigator: navigator,
          child: LightPage(device: device),
        ),
      );

      await tester.tap(find.byIcon(Icons.arrow_back));

      verify(() => navigator.pop<void>()).called(1);
    });

    testWidgets('CustomSwitch can be tapped', (tester) async {
      await tester.pumpApp(LightPage(device: device));

      await tester.tap(find.byKey(const Key('lightPageCustomSwitchKey')));
    });

    testWidgets('renders error widget when loading image failed',
        (tester) async {
      await tester.pumpApp(LightPage(device: device));
      await tester.pump();

      expect(
        find.byKey(const Key('lightPageBackgroundErorrKey')),
        findsOneWidget,
      );
    });

    testWidgets('schedule header button can be tapped', (tester) async {
      await tester.pumpApp(LightPage(device: device));

      await tester
          .tap(find.byKey(const Key('lightPageScheduleHeaderButtonKey')));
    });

    testWidgets('delete button can be tapped', (tester) async {
      await tester.pumpApp(LightPage(device: device));

      await tester.tap(find.byIcon(Icons.delete));
    });

    testWidgets('edit button can be tapped', (tester) async {
      await tester.pumpApp(LightPage(device: device));

      await tester.tap(find.byIcon(Icons.edit));
    });
  });
}
