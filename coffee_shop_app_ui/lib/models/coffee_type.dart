import 'package:flutter/material.dart';

import 'models.dart';

enum CoffeeType { cappuccino, espresso, latte, flatWhite, americano, macchiato }

extension CoffeeDetails on CoffeeType {
  String get name {
    switch (this) {
      case CoffeeType.cappuccino:
        return 'Cappuccino';
      case CoffeeType.espresso:
        return 'Espresso';
      case CoffeeType.latte:
        return 'Latte';
      case CoffeeType.flatWhite:
        return 'Flat White';
      case CoffeeType.americano:
        return 'Americano';
      case CoffeeType.macchiato:
        return 'Macchiato';
    }
  }

  String get description {
    switch (this) {
      case CoffeeType.cappuccino:
        return 'A cappuccino is a coffee-based drink made primarily from espresso and milk';
      default:
        return '';
    }
  }

  List<Ingredient> get baseIngredients {
    switch (this) {
      case CoffeeType.cappuccino:
        return [
          Ingredient(name: 'Coffee', icon: Icons.coffee),
          Ingredient(name: 'Milk', icon: Icons.water_drop),
        ];
      default:
        return const [];
    }
  }

  bool get isMediumRoasted {
    switch (this) {
      case CoffeeType.cappuccino:
        return true;
      default:
        return false;
    }
  }
}
