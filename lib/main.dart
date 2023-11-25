import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import './presentation/pages/pages.dart';

void main() {
  runApp(const StarWarsApp());
}

class StarWarsApp extends StatelessWidget {
  const StarWarsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Wars',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
            primary: Color(0xffe3e1dd), inversePrimary: Color(0xff1c1e22)),
        textTheme: const TextTheme(
            titleLarge: TextStyle(color: Color(0xffffe300)),
            bodySmall: TextStyle(color: Color(0xffc8c8c8))),
        scaffoldBackgroundColor: const Color(0xff282b30),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
