import 'package:flutter/material.dart';
import 'package:star_wars/models/models.dart';

import '../layouts/layouts.dart';
import '../widgets/widgets.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final ValueNotifier<StarWarsEntity> _starWarEntityController =
      ValueNotifier(StarWarsEntity.character);

  final TextEditingController _searchController = SearchController();

  @override
  void dispose() {
    _starWarEntityController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: StarWarsSearch(
        searchController: _searchController,
        starWarEntityController: _starWarEntityController,
      ),
      drawer: const StarWarsNavigationDrawer(activePath: '/favorite'),
      bottomNavigationBar:
          StarWarsBottomNavigationBar(controller: _starWarEntityController),
      body: const Text('FavoritePage'),
    );
  }
}
