import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(widget.title, context),
      body: _body(),
    );
  }
}

_appBar(String title, context) {
  return AppBar(
    centerTitle: true,
    title: Text(title),
    backgroundColor: Theme.of(context).colorScheme.inversePrimary,
  );
}

_body() {
  return SafeArea(child: Container());
}
