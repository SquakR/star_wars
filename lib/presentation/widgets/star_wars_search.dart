import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:star_wars/models/models.dart';

class StarWarsSearch extends StatefulWidget {
  final TextEditingController searchController;
  final ValueNotifier<StarWarsEntity> starWarEntityController;

  const StarWarsSearch({
    super.key,
    required this.searchController,
    required this.starWarEntityController,
  });

  @override
  State<StarWarsSearch> createState() => _StarWarsSearch();
}

class _StarWarsSearch extends State<StarWarsSearch> {
  @override
  void initState() {
    super.initState();
    widget.starWarEntityController.addListener(() {
      widget.searchController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.starWarEntityController,
      builder: (context, value, child) {
        return TextField(
          controller: widget.searchController,
          style: Theme.of(context).textTheme.titleLarge,
          decoration: InputDecoration(
            hintText: switch (value) {
              StarWarsEntity.character =>
                AppLocalizations.of(context)!.charactersSearchHint,
              StarWarsEntity.starship =>
                AppLocalizations.of(context)!.starshipsSearchHint,
              StarWarsEntity.planet =>
                AppLocalizations.of(context)!.planetsSearchHint,
            },
            border: const UnderlineInputBorder(),
          ),
        );
      },
    );
  }
}
