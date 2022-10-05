import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app_ui/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Furniture E-Commerce App',
      home: IntroPage(),
    );
  }
}
