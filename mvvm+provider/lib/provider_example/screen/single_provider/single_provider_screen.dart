// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/count_provider.dart';

class SingleProvider extends StatefulWidget {
  const SingleProvider({super.key});

  @override
  State<SingleProvider> createState() => _SingleProviderState();
}

class _SingleProviderState extends State<SingleProvider> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // final countProvider = Provider.of<CountProvider>(context, listen: false);
    // Timer.periodic(Duration(seconds: 1), (timer) {
    //   countProvider.setCount();
    // });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print('build ${countProvider.count}');
    return Scaffold(
      appBar: appBar(),
      body: body(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: floatingActionButton(countProvider: countProvider),
    );
  }

  // appBar
  PreferredSizeWidget appBar() {
    return AppBar(
      title: const Text(
        "Single Provider",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  // body
  Widget body() {
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Consumer<CountProvider>(
          builder: (context, value, child) {
            print('text widget builds ${value.count}');
            return Text(
              value.count.toString(),
              style: const TextStyle(fontSize: 30),
            );
          },
        )),
      ],
    ));
  }

  // floating action button
  floatingActionButton({required CountProvider countProvider}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            heroTag: "tag2",
            onPressed: () {
              countProvider.setCount();
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            heroTag: "tag1",
            onPressed: () {
              countProvider.resetCount();
            },
            child: const Icon(
              Icons.autorenew_rounded,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
