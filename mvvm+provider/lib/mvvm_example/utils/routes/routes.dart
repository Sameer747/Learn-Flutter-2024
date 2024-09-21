import 'package:flutter/material.dart';
import 'package:provider_with_mvvm/home_screen.dart';
import 'package:provider_with_mvvm/mvvm_example/utils/routes/routes_name.dart';
import 'package:provider_with_mvvm/mvvm_example/view/screen/home_screen.dart';
import 'package:provider_with_mvvm/mvvm_example/view/screen/login_screen.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home_mvvm:
        return MaterialPageRoute(builder: (context) => const HomeScreenMvvm());
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: SafeArea(
                  child: Center(
                child: Text("No routes defined"),
              )),
            );
          },
        );
    }
  }
}
