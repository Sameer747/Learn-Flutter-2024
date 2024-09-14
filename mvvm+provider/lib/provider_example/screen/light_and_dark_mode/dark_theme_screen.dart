import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_mvvm/provider_example/provider/theme_changer_provider.dart';

class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({super.key});

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider =
        Provider.of<ThemeChangerProvider>(context, listen: true);
    print("build");
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        // foregroundColor: Colors.white,
        // backgroundColor: Colors.blue,
        title: const Text("Theme"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          RadioListTile<ThemeMode>(
              title: const Text("Light Theme"),
              value: ThemeMode.light,
              groupValue: themeProvider.themeMode,
              onChanged: themeProvider.setTheme),
          RadioListTile<ThemeMode>(
              title: const Text("Dark Theme"),
              value: ThemeMode.dark,
              groupValue: themeProvider.themeMode,
              onChanged: themeProvider.setTheme),
          RadioListTile<ThemeMode>(
              title: const Text("System Theme"),
              value: ThemeMode.system,
              groupValue: themeProvider.themeMode,
              onChanged: themeProvider.setTheme),
        ],
      )),
    );
  }
}
