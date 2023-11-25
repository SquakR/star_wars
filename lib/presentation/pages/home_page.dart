import 'package:flutter/material.dart';

import '../layouts/layouts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(child: Text("Default Page"));
  }
}
