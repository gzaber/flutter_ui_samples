import 'models.dart';

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
        'https://cdn.pixabay.com/photo/2022/08/04/13/41/cup-7364738_960_720.jpg',
    mainAddition: 'Oat Milk',
    price: 4.2,
    rating: 4.5,
    reviewers: 6986,
  ),
  Coffee(
    type: CoffeeType.cappuccino,
    size: CoffeeSize.small,
    imageUrl:
        'https://cdn.pixabay.com/photo/2017/08/30/05/50/cappuccino-2695985_960_720.jpg',
    mainAddition: 'Chocolate',
    price: 3.14,
    rating: 4.7,
    reviewers: 5433,
  ),
  Coffee(
    type: CoffeeType.cappuccino,
    size: CoffeeSize.small,
    imageUrl:
        'https://cdn.pixabay.com/photo/2016/08/03/19/57/coffee-1567613_960_720.jpg',
    mainAddition: 'Cocoa',
    price: 4.1,
    rating: 4.3,
    reviewers: 4633,
  ),
  Coffee(
    type: CoffeeType.cappuccino,
    size: CoffeeSize.small,
    imageUrl:
        'https://cdn.pixabay.com/photo/2020/05/14/22/20/coffee-5171517_960_720.jpg',
    mainAddition: 'Cinnamon',
    price: 4.4,
    rating: 4.8,
    reviewers: 6645,
  ),
];
