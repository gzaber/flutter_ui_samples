import 'package:flutter/material.dart';

class Category {
  Category({
    required this.name,
    required this.icon,
    this.isChecked = false,
  });

  final String name;
  final IconData icon;
  final bool isChecked;

  static List<Category> categories = [
    Category(name: 'Chair', icon: Icons.chair_outlined, isChecked: true),
    Category(name: 'Bed', icon: Icons.bed),
    Category(name: 'Table', icon: Icons.table_bar_outlined),
    Category(name: 'Lamp', icon: Icons.light),
    Category(name: 'Wardrobe', icon: Icons.door_sliding_outlined),
  ];
}
