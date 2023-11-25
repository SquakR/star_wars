import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Widget child;

  const DefaultLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          "Star Wars",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: DefaultTextStyle.merge(
          style: Theme.of(context).textTheme.bodySmall, child: child),
    );
  }
}
