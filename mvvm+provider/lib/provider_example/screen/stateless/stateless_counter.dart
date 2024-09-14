import 'package:flutter/material.dart';

class StatelessCounter extends StatelessWidget {
  StatelessCounter({super.key});
  ValueNotifier<int> counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stateless Counter"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.value++;
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ValueListenableBuilder(
            valueListenable: toggle,
            builder: (context, value, child) {
              return TextFormField(
                controller: controller,
                obscureText: toggle.value,
                decoration: InputDecoration(
                    hintText: "Password",
                    suffix: IconButton(
                        onPressed: () {
                          toggle.value = !toggle.value;
                        },
                        icon: Icon(toggle.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility))),
              );
            },
          ),
          Center(
            child: ValueListenableBuilder(
              valueListenable: counter,
              builder: (context, value, child) {
                return Text(
                  counter.value.toString(),
                  style: const TextStyle(fontSize: 30),
                );
              },
            ),
          )
        ],
      )),
    );
  }
}
