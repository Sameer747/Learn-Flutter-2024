import 'package:flutter/foundation.dart';
import 'package:provider_with_mvvm/mvvm_example/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  // instance of user model
  UserModel userModel = UserModel();
  
  // function to save user token
  Future<bool> saveUserToken(UserModel user) async {
    // shared prefrences instance
    final SharedPreferences sp = await SharedPreferences.getInstance();

    // set the token 
    sp.setString("token", user.token.toString());

    // print the token in debug mode
    if (kDebugMode) {
      print("token: ${sp.get('token')}");
    }

    notifyListeners();
    return true;
  }

  // function to get user token
  Future<UserModel> getUserToken() async {
    // shared prefrences instance
    final SharedPreferences sp = await SharedPreferences.getInstance();

    // get the instance
    String? token = sp.getString("token");

    // print the token in debug mode
    if (kDebugMode) {
      print("=>token: $token");
    }

    return UserModel(token: token);
  }

  // function to remove user token
  Future<bool> removeUserToken() async {
    // shared prefrences instance
    final SharedPreferences sp = await SharedPreferences.getInstance();

    // print the instance in debug mode
    if (kDebugMode) {
      print("removed: ${sp.get('token')}");
    }

    return sp.clear();
  }
}
