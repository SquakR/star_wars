import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:star_wars/models/models.dart';

import '../layouts/layouts.dart';
import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<StarWarsEntity> starWarEntityController =
      ValueNotifier(StarWarsEntity.character);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: AppLocalizations.of(context)!.homePageTitle,
      drawer: const StarWarsNavigationDrawer(activePath: '/'),
      bottomNavigationBar:
          StarWarsBottomNavigationBar(controller: starWarEntityController),
      child: const Text("HomePage"),
    );
  }
}
