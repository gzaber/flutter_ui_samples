import 'package:coffee_shop_app_ui/models/models.dart';
import 'package:flutter/material.dart';

enum CoffeeType { cappuccino, espresso, latte, flatWhite, americano, macchiato }

extension CoffeeDetails on CoffeeType {
  String get name {
    switch (this) {
      case CoffeeType.cappuccino:
        return 'Cappucino';
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
      case CoffeeType.espresso:
        return '';
      case CoffeeType.latte:
        return '';
      case CoffeeType.flatWhite:
        return '';
      case CoffeeType.americano:
        return '';
      case CoffeeType.macchiato:
        return '';
    }
  }

  List<Ingredient> get baseIngredients {
    switch (this) {
      case CoffeeType.cappuccino:
        return [
          Ingredient(name: 'Coffee', icon: Icons.coffee),
          Ingredient(name: 'Milk', icon: Icons.pin_drop_sharp),
        ];
      case CoffeeType.espresso:
        return [];
      case CoffeeType.latte:
        return [];
      case CoffeeType.flatWhite:
        return [];
      case CoffeeType.americano:
        return [];
      case CoffeeType.macchiato:
        return [];
    }
  }

  bool get isMediumRoasted {
    switch (this) {
      case CoffeeType.cappuccino:
        return true;
      case CoffeeType.espresso:
        return false;
      case CoffeeType.latte:
        return true;
      case CoffeeType.flatWhite:
        return false;
      case CoffeeType.americano:
        return true;
      case CoffeeType.macchiato:
        return true;
    }
  }
}
