import 'package:flutter/material.dart';

import 'config/config.dart';
import 'pages/pages.dart';

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
