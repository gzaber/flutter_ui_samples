import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:furniture_ecommerce_app_ui/pages/pages.dart';
import 'package:mockingjay/mockingjay.dart';

import '../helpers.dart';

void main() {
  group('IntroPage', () {
    testWidgets('renders error icon when loading image failed', (tester) async {
      await tester.pumpApp(const IntroPage());
      await tester.pump();

      expect(find.byIcon(Icons.error), findsOneWidget);
    });

    testWidgets('NextButton can be tapped', (tester) async {
      await tester.pumpApp(const IntroPage());

      await tester.tap(find.byKey(const Key('introPageNextButtonKey')));
    });

    testWidgets('navigates to HomePage when item image is tapped',
        (tester) async {
      final navigator = MockNavigator();
      when(() => navigator.push<void>(any())).thenAnswer((_) async {});

      await tester.pumpApp(
        MockNavigatorProvider(
          navigator: navigator,
          child: const IntroPage(),
        ),
      );
      await tester.pump();

      await tester.ensureVisible(
        find.byKey(const Key('introPageSkipButtonKey')),
      );
      await tester.tap(
        find.byKey(const Key('introPageSkipButtonKey')),
      );

      verify(
        () => navigator
            .push<void>(any(that: isRoute<void>(whereName: equals('/home')))),
      ).called(1);
    });
  });
}
