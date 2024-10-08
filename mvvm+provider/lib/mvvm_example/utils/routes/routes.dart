import 'package:flutter/material.dart';
import 'package:provider_with_mvvm/home_screen.dart';
import 'package:provider_with_mvvm/mvvm_example/utils/routes/routes_name.dart';
import 'package:provider_with_mvvm/mvvm_example/view/screens/home_screen.dart';
import 'package:provider_with_mvvm/mvvm_example/view/screens/login_view.dart';
import 'package:provider_with_mvvm/mvvm_example/view/screens/signup_view.dart';
import 'package:provider_with_mvvm/mvvm_example/view/screens/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case RoutesName.home_mvvm:
        return MaterialPageRoute(builder: (context) => const HomeScreenMvvm());
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RoutesName.signup:
        return MaterialPageRoute(builder: (context) => const SignupView());
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
