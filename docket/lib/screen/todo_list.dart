import 'package:docket/models/save_task.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Docket'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/add');
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Consumer<SaveTask>(
            builder: (context, task, child) {
              return ListView.builder(
                itemCount: task.task.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      task.task[index].title.toString(),
                      style: TextStyle(
                          decoration: task.task[index].isCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                    trailing: Wrap(
                      children: [
                        Checkbox(
                            value: task.task[index].isCompleted,
                            onChanged: (_) {
                              context.read<SaveTask>().checkTask(index);
                            }),
                        IconButton(
                            onPressed: () {
                              context
                                  .read<SaveTask>()
                                  .removeTask(task.task[index]);
                            },
                            icon: const Icon(Icons.delete))
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
