import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DefaultLayout extends StatelessWidget {
  final Widget child;

  const DefaultLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          AppLocalizations.of(context)!.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: DefaultTextStyle.merge(
          style: Theme.of(context).textTheme.bodySmall, child: child),
    );
  }
}
