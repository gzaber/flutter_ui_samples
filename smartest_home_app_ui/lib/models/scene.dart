import 'package:flutter/material.dart';

class Scene {
  const Scene({
    required this.name,
    required this.icon,
  });

  final String name;
  final IconData icon;
}

const scenesList = [
  Scene(name: 'Home', icon: Icons.home),
  Scene(name: 'Away', icon: Icons.meeting_room),
  Scene(name: 'Sleep', icon: Icons.bedtime),
  Scene(name: 'Get up', icon: Icons.alarm),
  Scene(name: 'Eat', icon: Icons.restaurant),
  Scene(name: 'Read', icon: Icons.menu_book),
];
