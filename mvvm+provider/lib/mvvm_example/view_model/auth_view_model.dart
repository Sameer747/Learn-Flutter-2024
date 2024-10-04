// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_mvvm/mvvm_example/model/user_model.dart';
import 'package:provider_with_mvvm/mvvm_example/repository/auth_repository.dart';
import 'package:provider_with_mvvm/mvvm_example/utils/routes/routes_name.dart';
import 'package:provider_with_mvvm/mvvm_example/utils/utils.dart';
import 'package:provider_with_mvvm/mvvm_example/view_model/user_view_model.dart';

/*
 * The AuthViewModel class is basically an provider state management
 * which takes care of all the things related to authentication
 * which is a part of MVVM architecture
*/

class AuthViewModel extends ChangeNotifier {
  // initialize auth repository
  final _authRepo = AuthRepository();

  //set loading default to false
  bool _loading = false;
  
  // getter function to get the private loading value
  bool get loading => _loading;

  // setter funtion to set the loading value
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  // future funtion for the login api service via auth repository
  Future<void> loginApi({required dynamic data, required BuildContext context}) async {
    //set the loading to true
    setLoading(true);

    // assign a user model provider for token
    final userViewModel = Provider.of<UserViewModel>(context,listen: false);

    //wait for the response from auth repository
    await _authRepo.loginApi(data: data).then((value) {
      //if response then set loading to false
      setLoading(false);
      
      // save user token
      userViewModel.saveUserToken(UserModel(token: value['token'].toString()));

      //display a success message
      Utils.snackBar(context: context, message: "Login Successfully");

      //go to the next page 
      Navigator.pushNamed(context, RoutesName.home_mvvm);

      //print value in debug mode
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError(
      (error, stackTrace) {
        //if error then set loading to false
        setLoading(false);

        //display the error message
        Utils.flushBarErrorMessage(context: context, message: error.toString());

        //print the value in debug mode 
        if (kDebugMode) {
          print(error.toString());
        }
      },
    );
  }

  // future funtion for the signup api service via auth repository
  Future<void> signUpApi({required dynamic data, required BuildContext context}) async {
    //set the loading to true
    setLoading(true);

    //wait for the response from auth repository
    await _authRepo.signUpApi(data: data).then((value) {
      //if response then set loading to false
      setLoading(false);

      //display a success message
      Utils.snackBar(context: context, message: "SignUp Successfully");

      //go to the next page 
      Navigator.pushNamed(context, RoutesName.home_mvvm);

      //print value in debug mode
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError(
      (error, stackTrace) {
        //if error then set loading to false
        setLoading(false);

        //display the error message
        Utils.flushBarErrorMessage(context: context, message: error.toString());
        
        //print the value in debug mode 
        if (kDebugMode) {
          print(error.toString());
        }
      },
    );
  }
}
