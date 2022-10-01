import 'package:flutter/material.dart';
import 'package:lamp_shop_app_ui/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lamp Shop App UI',
      home: HomePage(),
    );
  }
}
