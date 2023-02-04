import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lamp_shop_app_ui/models/models.dart';
import 'package:lamp_shop_app_ui/pages/pages.dart';
import 'package:mockingjay/mockingjay.dart';

import '../helpers.dart';

void main() {
  group('DetailsPage', () {
    final lamp = Lamp.lamps.first;

    testWidgets('is routable', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(builder: (context) {
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(context, DetailsPage.route(lamp: lamp));
                },
              ),
            );
          }),
        ),
      );
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      expect(find.byType(DetailsPage), findsOneWidget);
    });

    testWidgets('more IconButton can be tapped', (tester) async {
      await tester.pumpApp(DetailsPage(lamp: lamp));

      await tester.tap(
        find.byKey(const Key('detailsPageMoreIconButtonKey')),
      );
    });

    testWidgets('renders error icon when loading image failed', (tester) async {
      await tester.pumpApp(DetailsPage(lamp: lamp));
      await tester.pump();

      expect(find.byIcon(Icons.error), findsOneWidget);
    });

    testWidgets('BuyButton can be tapped', (tester) async {
      await tester.pumpApp(DetailsPage(lamp: lamp));

      await tester.tap(find.byKey(const Key('detailsPageBuyButtonKey')));
    });

    testWidgets('pops when back button is tapped', (tester) async {
      final navigator = MockNavigator();
      when(() => navigator.pop<void>()).thenAnswer((_) async {});

      await tester.pumpApp(
        MockNavigatorProvider(
          navigator: navigator,
          child: DetailsPage(lamp: lamp),
        ),
      );

      await tester.tap(find.byIcon(Icons.arrow_back));

      verify(() => navigator.pop<void>()).called(1);
    });
  });
}
