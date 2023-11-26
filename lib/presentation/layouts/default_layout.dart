import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Widget title;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 68,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: title,
      ),
      body: body,
      drawer: drawer,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
