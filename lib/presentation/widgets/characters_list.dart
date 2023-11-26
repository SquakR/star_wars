import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars/blocs/blocs.dart';
import 'package:star_wars/models/models.dart';
import 'package:star_wars/presentation/widgets/star_wars_entity_list.dart';
import 'package:star_wars/repositories/repositories.dart';

import './character_list_tile.dart';

class CharactersList extends StatefulWidget {
  final ValueNotifier<String> searchController;

  const CharactersList({super.key, required this.searchController});

  @override
  State<CharactersList> createState() => _CharactersListState();
}

class _CharactersListState extends State<CharactersList> {
  late final CharacterRemoteRepository _characterRemoteRepository;
  late final SearchBloc<Character> _searchBloc;

  @override
  void dispose() {
    _searchBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _characterRemoteRepository = CharacterRemoteRepository();
    _searchBloc = SearchBloc(_characterRemoteRepository);

    widget.searchController.addListener(() {
      _searchBloc.add(SearchEvent(widget.searchController.value));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc<Character>, SearchState<Character>>(
      bloc: _searchBloc,
      builder: (context, searchState) {
        return StarWarsEntityList(
          searchState: searchState,
          tileBuilder: (BuildContext context, int index) {
            return CharacterListTile(
              character: searchState.itemList[index],
              trailing: const Icon(Icons.favorite),
            );
          },
        );
      },
    );
  }
}
