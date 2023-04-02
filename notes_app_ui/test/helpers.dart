import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:notes_app_ui/notifiers/notifiers.dart';
import 'package:provider/provider.dart';

extension WidgetTesterX on WidgetTester {
  Future<void> pumpApp({
    required Widget widget,
    CategoryNotifier? categoryNotifier,
  }) {
    return pumpWidget(
      MaterialApp(
        home: categoryNotifier == null
            ? widget
            : ChangeNotifierProvider.value(
                value: categoryNotifier,
                builder: (context, child) => widget,
              ),
      ),
    );
  }
}
