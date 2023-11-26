import 'package:flutter/material.dart';
import 'package:star_wars/models/models.dart';

import '../layouts/layouts.dart';
import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<StarWarsEntity> _starWarEntityController =
      ValueNotifier(StarWarsEntity.character);

  final ValueNotifier<String> _searchController = ValueNotifier("");

  @override
  void dispose() {
    _starWarEntityController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _starWarEntityController,
      builder: (context, value, child) {
        return DefaultLayout(
          title: StarWarsSearch(
            searchController: _searchController,
            starWarEntityController: _starWarEntityController,
          ),
          drawer: const StarWarsNavigationDrawer(activePath: '/'),
          bottomNavigationBar:
              StarWarsBottomNavigationBar(controller: _starWarEntityController),
          body: CharactersList(searchController: _searchController),
        );
      },
    );
  }
}
