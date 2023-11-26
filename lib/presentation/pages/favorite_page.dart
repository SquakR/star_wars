import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:star_wars/models/models.dart';

import '../layouts/layouts.dart';
import '../widgets/widgets.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final ValueNotifier<StarWarsEntity> starWarEntityController =
      ValueNotifier(StarWarsEntity.character);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: AppLocalizations.of(context)!.favoritePageTitle,
      drawer: const StarWarsNavigationDrawer(activePath: '/favorite'),
      bottomNavigationBar:
          StarWarsBottomNavigationBar(controller: starWarEntityController),
      body: const Text("FavoritePage"),
    );
  }
}
