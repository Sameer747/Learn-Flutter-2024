import 'package:flutter/foundation.dart';
import 'package:provider_with_mvvm/mvvm_example/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  UserModel userModel = UserModel();
  Future<bool> saveUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("token", userModel.token.toString());
    if (kDebugMode) {
      print("token: ${sp.get('token')}");
    }
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString("token");
    // print("=>token: $token");
    return UserModel(token: token);
  }

  Future<bool> removeSession() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    if (kDebugMode) {
      print("removed: ${sp.get('token')}");
    }
    return sp.clear();
  }
}
