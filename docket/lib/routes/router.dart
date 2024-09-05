import 'package:docket/screen/add_todo.dart';
import 'package:docket/screen/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRouter goRouter() {
  return GoRouter(initialLocation: '/', routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const TodoList(),
    ),
    GoRoute(
      path: '/add',
      name: 'addTodoList',
      pageBuilder: (context, state) => CustomTransitionPage(
        child: AddTodoList(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut, // You can adjust the curve as needed
          );

          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0), // Slide in from the right
              end: Offset.zero, // End at the current position
            ).animate(curvedAnimation),
            child: child,
          );
        },
        transitionDuration:
            const Duration(milliseconds: 800), // Adjust the duration as needed
      ),
      builder: (context, state) => AddTodoList(),
    )
  ]);
}
