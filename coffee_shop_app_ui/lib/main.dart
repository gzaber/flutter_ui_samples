import 'package:coffee_shop_app_ui/config/config.dart';
import 'package:coffee_shop_app_ui/pages/pages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee Shop App',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.black,
      ),
      home: const HomePage(),
    );
  }
}
