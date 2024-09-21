import 'package:flutter/material.dart';
import 'package:provider_with_mvvm/mvvm_example/utils/routes/routes_name.dart';
import 'package:provider_with_mvvm/mvvm_example/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutesName.home_mvvm);
              Utils.toastMessage(message: "Login Successfully!");
              Utils.flushBarErrorMessage(
                  context: context, message: "Login successful");
              Utils.snackBar(context: context, message: "Login Sucessfully");
            },
            child: const Center(child: Text("Click Me"))),
      ),
    );
  }
}
