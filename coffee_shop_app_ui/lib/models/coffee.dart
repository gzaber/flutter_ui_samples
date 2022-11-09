import 'package:coffee_shop_app_ui/models/models.dart';

enum CoffeeSize { small, medium, large }

class Coffee {
  const Coffee({
    required this.type,
    required this.size,
    required this.imageUrl,
    required this.mainAddition,
    required this.price,
    required this.rating,
    required this.reviewers,
  });

  final CoffeeType type;
  final CoffeeSize size;
  final String imageUrl;
  final String mainAddition;

  final double price;
  final double rating;
  final int reviewers;
}

const coffees = [
  Coffee(
    type: CoffeeType.cappuccino,
    size: CoffeeSize.small,
    imageUrl:
        'https://images.unsplash.com/photo-1512568400610-62da28bc8a13?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    mainAddition: 'Oat Milk',
    price: 4.2,
    rating: 4.5,
    reviewers: 6986,
  ),
  Coffee(
    type: CoffeeType.cappuccino,
    size: CoffeeSize.small,
    imageUrl:
        'https://images.unsplash.com/photo-1600056781444-55f3b64235e3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
    mainAddition: 'Chocolate',
    price: 3.14,
    rating: 4.7,
    reviewers: 5433,
  ),
  Coffee(
    type: CoffeeType.cappuccino,
    size: CoffeeSize.small,
    imageUrl:
        'https://images.unsplash.com/photo-1572097662444-003d63fe5884?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
    mainAddition: 'Cocoa',
    price: 4.1,
    rating: 4.3,
    reviewers: 4633,
  ),
  Coffee(
    type: CoffeeType.cappuccino,
    size: CoffeeSize.small,
    imageUrl:
        'https://images.unsplash.com/photo-1556124536-ed4da560eba8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    mainAddition: 'Cinnamon',
    price: 4.4,
    rating: 4.8,
    reviewers: 6645,
  ),
];
