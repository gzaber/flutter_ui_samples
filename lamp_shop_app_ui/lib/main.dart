import 'package:flutter/material.dart';
import 'package:lamp_shop_app_ui/config/config.dart';

import 'package:lamp_shop_app_ui/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lamp Shop App UI',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          titleTextStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: AppColors.lightBlack,
                fontWeight: FontWeight.bold,
              ),
          iconTheme: const IconThemeData(
            color: AppColors.lightBlack,
          ),
          elevation: 0,
        ),
      ),
      home: const HomePage(),
    );
  }
}
