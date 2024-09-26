// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider_with_mvvm/mvvm_example/repository/auth_repository.dart';
import 'package:provider_with_mvvm/mvvm_example/utils/routes/routes_name.dart';
import 'package:provider_with_mvvm/mvvm_example/utils/utils.dart';

class AuthViewModel extends ChangeNotifier {
  final _authRepo = AuthRepository();
  bool _loading = false;

  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(
      {required dynamic data, required BuildContext context}) async {
    setLoading(true);
    await _authRepo.loginApi(data: data).then((value) {
      setLoading(false);
      Utils.snackBar(context: context, message: "Login Successfully");
      Navigator.pushNamed(context, RoutesName.home_mvvm);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError(
      (error, stackTrace) {
        setLoading(false);
        Utils.flushBarErrorMessage(context: context, message: error.toString());
        if (kDebugMode) {
          print(error.toString());
        }
      },
    );
  }
}
