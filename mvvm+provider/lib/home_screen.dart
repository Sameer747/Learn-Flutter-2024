import 'package:flutter/material.dart';
import 'package:provider_with_mvvm/mvvm_example/view/screen/login_view.dart';
import 'package:provider_with_mvvm/provider_example/utils/constants.dart';
import 'package:provider_with_mvvm/provider_example/utils/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MVVM + PROVIDER",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
          maintainBottomViewPadding: true,
          child: SafeArea(
            child: Column(
              children: [
                customTile(
                    context: context,
                    title: "Provider Example",
                    icon: const Icon(Icons.animation_sharp),
                    navigateTo: const ProviderExamplesScreen()),
                customTile(
                    context: context,
                    title: "MVVM Example",
                    icon: const Icon(Icons.animation_sharp),
                    navigateTo: const LoginView())
              ],
            ),
          )),
    );
  }
}

class ProviderExamplesScreen extends StatelessWidget {
  const ProviderExamplesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Example"),
      ),
      body: SafeArea(
          child: ListView.builder(
        itemCount: map.length,
        itemBuilder: (context, index) {
          String title = map.keys.elementAt(index);
          Widget navigateTo = map.values.elementAt(index);
          return customTile(
              context: context,
              title: title,
              icon: const Icon(Icons.animation_sharp),
              navigateTo: navigateTo);
        },
      )),
    );
  }
}
