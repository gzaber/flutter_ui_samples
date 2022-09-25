import 'package:flutter/material.dart';
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
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          titleTextStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: const Color(0xFF444444),
                fontWeight: FontWeight.bold,
              ),
          iconTheme: const IconThemeData(
            color: Color(0xFF444444),
          ),
          elevation: 0,
        ),
      ),
      home: const HomePage(),
    );
  }
}
