import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../layouts/layouts.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: AppLocalizations.of(context)!.favoritePageTitle,
        activePath: '/favorite',
        child: const Text("FavoritePage"));
  }
}
