import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:star_wars/blocs/blocs.dart';

class StarWarsEntityList<T> extends StatelessWidget {
  final SearchState<T> searchState;
  final NullableIndexedWidgetBuilder tileBuilder;

  const StarWarsEntityList({
    super.key,
    required this.searchState,
    required this.tileBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    if (searchState.itemList.isNotEmpty) {
      children.add(ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: searchState.itemList.length,
        itemBuilder: tileBuilder,
      ));
    }
    if (searchState.loading) {
      children.add(Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ));
    }
    if (searchState.itemList.isEmpty && !searchState.loading) {
      if (searchState.search.length < 2) {
        children.add(Center(
            child: Text(
          AppLocalizations.of(context)!.enterSearchQuery,
          style: Theme.of(context).textTheme.titleLarge,
        )));
      } else {
        children.add(Center(
          child: Text(
            AppLocalizations.of(context)!.noResultsFound,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ));
      }
    }
    return Stack(
      alignment: Alignment.topCenter,
      children: children,
    );
  }
}
