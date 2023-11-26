import 'package:flutter/material.dart';
import 'package:star_wars/models/models.dart';

class StarWarsBottomNavigationBar extends StatelessWidget {
  final ValueNotifier<StarWarsEntity> controller;

  const StarWarsBottomNavigationBar({super.key, required this.controller});

  static const entities = [
    StarWarsEntity.character,
    StarWarsEntity.starship,
    StarWarsEntity.planet,
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, value, child) {
        return BottomNavigationBar(
          currentIndex: entities.indexOf(value),
          onTap: (index) {
            controller.value = entities[index];
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.android), label: 'Characters'),
            BottomNavigationBarItem(
                icon: Icon(Icons.rocket), label: 'Starships'),
            BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Planets'),
          ],
        );
      },
    );
  }
}
