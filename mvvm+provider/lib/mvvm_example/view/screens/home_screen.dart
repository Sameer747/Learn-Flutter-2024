import 'package:flutter/material.dart';
import 'package:provider_with_mvvm/mvvm_example/utils/routes/routes_name.dart';
import 'package:provider_with_mvvm/mvvm_example/view_model/user_view_model.dart';

class HomeScreenMvvm extends StatefulWidget {
  const HomeScreenMvvm({super.key});

  @override
  State<HomeScreenMvvm> createState() => _HomeScreenMvvmState();
}

class _HomeScreenMvvmState extends State<HomeScreenMvvm> {
  UserViewModel userViewModel = UserViewModel();
  void handleClick(int item) {
    switch (item) {
      case 0:
        userViewModel.removeSession();
        Navigator.pushNamed(context, RoutesName.splash);
        break;
      case 1:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
        actions: <Widget>[
          PopupMenuButton<int>(
            onSelected: (item) {
              handleClick(item);
            },
            // onSelected: (item) => handleClick(item),
            itemBuilder: (context) => [
              const PopupMenuItem<int>(value: 0, child: Text('Logout')),
              const PopupMenuItem<int>(value: 1, child: Text('Settings')),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Text(
            "Home Screen",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ),
    );
  }
}
