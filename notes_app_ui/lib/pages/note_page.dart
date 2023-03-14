import 'package:flutter/material.dart';

import '../models/models.dart';

class NotePage extends StatelessWidget {
  const NotePage({
    super.key,
    required this.note,
  });

  final Note note;

  static Route route({required Note note}) {
    return MaterialPageRoute(
      builder: (_) => NotePage(note: note),
      settings: const RouteSettings(name: '/note'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
