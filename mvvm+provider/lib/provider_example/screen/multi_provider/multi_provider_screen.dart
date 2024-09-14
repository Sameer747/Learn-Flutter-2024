import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/slider_provider.dart';

class MultipleProvider extends StatefulWidget {
  const MultipleProvider({super.key});

  @override
  State<MultipleProvider> createState() => _MultipleProviderState();
}

class _MultipleProviderState extends State<MultipleProvider> {
  @override
  Widget build(BuildContext context) {
    // final sliderProvider = Provider.of<SliderProvider>(context, listen: true);
    print('build method called');
    return Scaffold(
      appBar: appBar(),
      body: body(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton:
      //     floatingActionButton(sliderProvider: sliderProvider),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text("Multi Provider"),
      elevation: 20,
      shadowColor: Colors.amber[100],
    );
  }

  Widget body() {
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer<SliderProvider>(builder: (context, value, child) {
          print("Sameer Mohsin builds");
          return Container(
            decoration:
                BoxDecoration(color: Colors.amber.withOpacity(value.value)),
            height: 200,
            child: const Center(
              child: Text("Sameer Mohsin"),
            ),
          );
        }),
        Consumer<SliderProvider>(
          builder: (context, value, child) {
            print("slider builds only");
            return Slider(
              value: value.value,
              onChanged: (double val) {
                value.setValue(val);
              },
            );
          },
        ),
        Consumer<SliderProvider>(
          builder: (context, value, child) {
            print("container1&2 builds only");
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(value.value)),
                    child: const Center(child: Text("Contaier 1")),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(value.value)),
                    child: const Center(child: Text("Contaier 1")),
                  ),
                )
              ],
            );
          },
        ),
      ],
    ));
  }

  FloatingActionButton floatingActionButton(
      {required SliderProvider sliderProvider}) {
    return FloatingActionButton(
      onPressed: () {
        sliderProvider.resetValue();
      },
      child: const Icon(CupertinoIcons.arrow_2_circlepath_circle_fill),
    );
  }
}
