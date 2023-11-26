import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.android),
              label: AppLocalizations.of(context)!.characters,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.rocket),
              label: AppLocalizations.of(context)!.starships,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.public),
              label: AppLocalizations.of(context)!.planets,
            ),
          ],
        );
      },
    );
  }
}
