import 'package:flutter/material.dart';
import 'package:smartest_home_app_ui/config/config.dart';
import 'package:smartest_home_app_ui/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smartest Home App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        scaffoldBackgroundColor: AppColors.brownBackground,
      ),
      home: const HomePage(),
    );
  }
}
