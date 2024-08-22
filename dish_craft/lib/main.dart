import 'package:flutter/material.dart';

import 'homepage.dart';

void main() {
  runApp(const DishCraft());
}

class DishCraft extends StatelessWidget {
  const DishCraft({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme.copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent)),
      home: const MyHomePage(title: 'Dish Craft'),
    );
  }
}
