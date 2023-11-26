import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import './presentation/pages/pages.dart';

void main() {
  runApp(const StarWarsApp());
}

class StarWarsApp extends StatelessWidget {
  static const primary = Color(0xffe3e1dd);
  static const inversePrimary = Color(0xff1c1e22);
  static const scaffoldBackground = Color(0xff282b30);
  static const secondary = Color(0xffffe300);

  const StarWarsApp({super.key});

  CustomTransitionPage buildPage(GoRouterState state, Widget page) {
    return CustomTransitionPage(
      transitionDuration: const Duration(milliseconds: 250),
      key: state.pageKey,
      child: page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeIn)),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Star Wars',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
            primary: primary,
            inversePrimary: inversePrimary,
            secondary: secondary),
        textTheme: const TextTheme(titleLarge: TextStyle(color: secondary)),
        drawerTheme: const DrawerThemeData(backgroundColor: inversePrimary),
        bottomNavigationBarTheme:
            const BottomNavigationBarThemeData(backgroundColor: inversePrimary),
        listTileTheme: const ListTileThemeData(selectedColor: secondary),
        scaffoldBackgroundColor: scaffoldBackground,
      ),
      routerConfig: GoRouter(routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => buildPage(state, const HomePage()),
        ),
        GoRoute(
          path: '/favorite',
          pageBuilder: (context, state) =>
              buildPage(state, const FavoritePage()),
        ),
      ]),
    );
  }
}
