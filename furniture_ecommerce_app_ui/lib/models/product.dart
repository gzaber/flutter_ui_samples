import 'package:flutter/material.dart';

import 'package:furniture_ecommerce_app_ui/models/models.dart';

class Product {
  const Product({
    required this.id,
    required this.category,
    required this.name,
    required this.description,
    required this.manufacturer,
    required this.imageUrl,
    required this.isFavorite,
    required this.rating,
    required this.price,
    required this.color,
  });

  final int id;
  final String name;
  final String description;
  final String manufacturer;
  final String imageUrl;
  final bool isFavorite;
  final double rating;
  final double price;
  final Category category;
  final Color color;

  static String introImageUrl =
      'https://images.unsplash.com/photo-1503602642458-232111445657?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80';

  static List<Product> products = [
    Product(
      id: 1,
      name: 'Arm chair',
      manufacturer: 'CB2 Exclusive',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      imageUrl:
          'https://cdn.pixabay.com/photo/2019/10/29/12/57/oversized-4586851_960_720.png',
      isFavorite: false,
      rating: 4.9,
      price: 120,
      category: Category.categories[0],
      color: Colors.brown,
    ),
    Product(
      id: 2,
      name: 'Griny chair',
      manufacturer: 'CB2 Exclusive',
      description:
          'Clean lines and generous with spase regardless if you are going to read a book, play a game or just relax in it.',
      imageUrl:
          'https://cdn.pixabay.com/photo/2019/03/21/03/29/chair-4070161_960_720.png',
      isFavorite: true,
      rating: 4.7,
      price: 154,
      category: Category.categories[0],
      color: const Color(0xFF0E3757),
    ),
    Product(
      id: 3,
      name: 'Luxary chair',
      manufacturer: 'CB2 Exclusive',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      imageUrl:
          'https://cdn.pixabay.com/photo/2017/09/27/02/47/throne-2790789_960_720.png',
      isFavorite: false,
      rating: 4.8,
      price: 180,
      category: Category.categories[0],
      color: Colors.red,
    ),
    Product(
      id: 4,
      name: 'Office chair',
      manufacturer: 'CB2 Exclusive',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      imageUrl:
          'https://cdn.pixabay.com/photo/2019/06/18/06/01/chair-4281512_960_720.png',
      isFavorite: false,
      rating: 4.6,
      price: 122.56,
      category: Category.categories[0],
      color: Colors.pink,
    ),
    Product(
      id: 5,
      name: 'Deco chair',
      manufacturer: 'CB2 Exclusive',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      imageUrl:
          'https://cdn.pixabay.com/photo/2019/01/29/01/26/chair-3961572_960_720.png',
      isFavorite: false,
      rating: 4.7,
      price: 144.67,
      category: Category.categories[0],
      color: Colors.grey,
    ),
    Product(
      id: 6,
      name: 'Wooden chair',
      manufacturer: 'CB2 Exclusive',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      imageUrl:
          'https://cdn.pixabay.com/photo/2019/11/07/13/27/comfy-chair-4608886_960_720.png',
      isFavorite: false,
      rating: 4.4,
      price: 145.99,
      category: Category.categories[0],
      color: Colors.orange,
    ),
  ];
}
