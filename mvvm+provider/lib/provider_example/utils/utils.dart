import 'package:flutter/material.dart';

// page transition animation
Route createRoute({required Widget child}) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 450),
    reverseTransitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      final tween = Tween(begin: begin, end: end);
      final offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}

// light theme
ThemeData lightThemeData() {
  return ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.indigo, foregroundColor: Colors.white),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.indigo,
      foregroundColor: Colors.white,
    ),
    brightness: Brightness.light,
    useMaterial3: true,
  );
}

// dark theme
ThemeData darkThemeData() {
  return ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.blueAccent, foregroundColor: Colors.white),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.blueAccent,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))
      )
    ),
    brightness: Brightness.dark,
    useMaterial3: true,
  );
}
