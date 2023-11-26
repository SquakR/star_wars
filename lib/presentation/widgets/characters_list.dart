import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars/blocs/blocs.dart';
import 'package:star_wars/models/models.dart';
import 'package:star_wars/repositories/repositories.dart';

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
      builder: (context, state) {
        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: state.itemList.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 50,
              child: Center(child: Text(state.itemList[index].name)),
            );
          },
        );
      },
    );
  }
}
