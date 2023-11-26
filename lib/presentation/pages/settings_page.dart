import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../layouts/layouts.dart';
import '../widgets/widgets.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: AppLocalizations.of(context)!.settingsPageTitle,
      drawer: const StarWarsNavigationDrawer(activePath: '/settings'),
      body: const Text("SettingsPage"),
    );
  }
}
