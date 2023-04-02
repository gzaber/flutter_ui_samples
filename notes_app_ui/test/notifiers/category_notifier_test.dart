import 'package:flutter_test/flutter_test.dart';
import 'package:notes_app_ui/models/models.dart';
import 'package:notes_app_ui/notifiers/notifiers.dart';

void main() {
  group('CategoryNotifier', () {
    late CategoryNotifier categoryNotifier;

    setUp(() {
      categoryNotifier = CategoryNotifier();
    });

    test('default category name is empty', () {
      expect(categoryNotifier.categoryName, isEmpty);
    });

    test('updates category name', () {
      categoryNotifier.update(Category(name: 'name'));

      expect(categoryNotifier.categoryName, 'name');
    });

    test('clears category name when updated with the same category', () {
      final category = Category(name: 'name');
      categoryNotifier.update(category);
      categoryNotifier.update(category);

      expect(categoryNotifier.categoryName, isEmpty);
    });

    test('clears category name', () {
      categoryNotifier.clear();

      expect(categoryNotifier.categoryName, isEmpty);
    });
  });
}
