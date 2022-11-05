import 'package:coffee_shop_app_ui/models/models.dart';

enum CoffeeSize { small, medium, large }

class Coffee {
  Coffee({
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

List<Coffee> coffeeList = [
  Coffee(
    type: CoffeeType.cappuccino,
    size: CoffeeSize.small,
    imageUrl: '',
    mainAddition: 'Oat Milk',
    price: 4.2,
    rating: 4.5,
    reviewers: 6986,
  ),
  Coffee(
    type: CoffeeType.cappuccino,
    size: CoffeeSize.small,
    imageUrl: '',
    mainAddition: 'Chocolate',
    price: 4.5,
    rating: 4.7,
    reviewers: 5433,
  ),
  Coffee(
    type: CoffeeType.cappuccino,
    size: CoffeeSize.small,
    imageUrl: '',
    mainAddition: 'Cocoa',
    price: 4.1,
    rating: 4.3,
    reviewers: 4633,
  ),
  Coffee(
    type: CoffeeType.cappuccino,
    size: CoffeeSize.small,
    imageUrl: '',
    mainAddition: 'Cinnamon',
    price: 4.4,
    rating: 4.8,
    reviewers: 6645,
  ),
];
