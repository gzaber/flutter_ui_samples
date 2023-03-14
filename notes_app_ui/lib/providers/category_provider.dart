import 'package:flutter/foundation.dart' hide Category;

import '../models/models.dart';

class CategoryProvider extends ChangeNotifier {
  Category? _category;

  String get categoryName => _category != null ? _category!.name : '';

  void update(Category category) {
    if (category == _category) {
      _category = null;
    } else {
      _category = category;
    }
    notifyListeners();
  }

  void clear() {
    _category = null;
    notifyListeners();
  }
}
