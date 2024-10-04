import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider_with_mvvm/mvvm_example/model/user_model.dart';
import 'package:provider_with_mvvm/mvvm_example/utils/routes/routes_name.dart';
import 'package:provider_with_mvvm/mvvm_example/view_model/user_view_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUserToken();

  void checkAuthentication(BuildContext context) async {
    await getUserData().then(
      (value) {
        if (value.token == null || value.token == "") {
          if (kDebugMode) {
            print("=>if");
            print(value.token.toString());
          }
          if (!context.mounted) return;
          Navigator.pushNamed(context, RoutesName.login);
        } else {
          if (kDebugMode) {
            print("=>else");
            print(value.token.toString());
          }
          Future.delayed(Duration(seconds: 5));
          Navigator.pushNamed(context, RoutesName.home_mvvm);
        }
      },
    ).onError(
      (error, stackTrace) {
        if (kDebugMode) {
          print(error.toString());
        }
      },
    );
  }
}
