import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../layouts/layouts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: AppLocalizations.of(context)!.homePageTitle,
        activePath: '/',
        child: const Text("HomePage"));
  }
}
