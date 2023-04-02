import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';
import 'notifiers/notifiers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes App UI',
      theme: ThemeData(
        fontFamily: 'NeueMontreal',
      ),
      home: ChangeNotifierProvider(
        create: (context) => CategoryNotifier(),
        child: const HomePage(),
      ),
    );
  }
}
