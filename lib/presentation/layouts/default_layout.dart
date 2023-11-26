import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? drawer;
  final Widget? bottomNavigationBar;

  const DefaultLayout({
    super.key,
    required this.title,
    required this.body,
    this.drawer,
    this.bottomNavigationBar,
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
      body: body,
      drawer: drawer,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
