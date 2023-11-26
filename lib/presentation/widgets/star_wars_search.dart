import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:star_wars/models/models.dart';

class StarWarsSearch extends StatefulWidget {
  final ValueNotifier<String> searchController;
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
  final TextEditingController _editingSearchController =
      TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    widget.starWarEntityController.addListener(() {
      _editingSearchController.text = '';
    });
    widget.searchController.addListener(() {
      if (widget.searchController.value == _editingSearchController.text) {
        return;
      }
      _editingSearchController.text = widget.searchController.value;
    });
    _editingSearchController.addListener(() {
      if (_editingSearchController.text == widget.searchController.value) {
        return;
      }
      if (_debounce != null && _debounce!.isActive) {
        _debounce!.cancel();
      }
      _debounce = Timer(const Duration(milliseconds: 500), () {
        widget.searchController.value = _editingSearchController.text;
      });
    });
  }

  @override
  void dispose() {
    _editingSearchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.starWarEntityController,
      builder: (context, value, child) {
        return TextField(
          controller: _editingSearchController,
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
