import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class DefaultLayout extends StatelessWidget {
  final String title;
  final String activePath;
  final Widget child;

  const DefaultLayout({
    super.key,
    required this.title,
    required this.activePath,
    required this.child,
  });

  static const paths = ['/', '/favorite', '/settings'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: child,
      drawer: NavigationDrawer(
        selectedIndex: paths.indexOf(activePath),
        onDestinationSelected: (int index) {
          context.go(paths[index]);
        },
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 16),
            child: Text(
              AppLocalizations.of(context)!.drawerTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          NavigationDrawerDestination(
              label: Text(AppLocalizations.of(context)!.homePageTitle),
              icon: const Icon(Icons.home_outlined),
              selectedIcon: const Icon(Icons.home)),
          NavigationDrawerDestination(
              label: Text(AppLocalizations.of(context)!.favoritePageTitle),
              icon: const Icon(Icons.favorite_outline),
              selectedIcon: const Icon(Icons.favorite)),
          NavigationDrawerDestination(
              label: Text(AppLocalizations.of(context)!.settingsPageTitle),
              icon: const Icon(Icons.search_outlined),
              selectedIcon: const Icon(Icons.settings)),
        ],
      ),
    );
  }
}
