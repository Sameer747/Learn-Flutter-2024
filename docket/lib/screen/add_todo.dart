import 'package:docket/models/save_task.dart';
import 'package:docket/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AddTodoList extends StatelessWidget {
  AddTodoList({super.key});

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(context),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text('Add Todo'),
      leading: IconButton(
          onPressed: () => context.go('/'),
          icon: const Icon(Icons.arrow_back_ios_new)),
    );
  }

  _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: controller,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: 'Title',
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              context
                  .read<SaveTask>()
                  .addTask(Task(title: controller.text, isCompleted: false));
              controller.clear();
              return context.go('/');
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
