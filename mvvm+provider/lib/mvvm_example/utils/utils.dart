import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void fieldFocusNode(
      {required BuildContext context,
      required FocusNode currentFocus,
      required FocusNode nextFocus}) {
    currentFocus.unfocus();
    nextFocus.requestFocus();
  }

  static toastMessage({required String message}) {
    Fluttertoast.showToast(
        gravity: ToastGravity.CENTER,
        toastLength: Toast.LENGTH_SHORT,
        msg: message);
  }

  static void flushBarErrorMessage(
      {required BuildContext context, required String message}) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          reverseAnimationCurve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(15),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 5),
          icon: const Icon(
            Icons.error,
            color: Colors.white,
          ),
          positionOffset: MediaQuery.of(context).size.height * 0.10,
          flushbarPosition: FlushbarPosition.TOP,
          // title: "Sad",
          message: message,
          
        )..show(context));
  }

  static snackBar({required BuildContext context, required String message}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.greenAccent,
        content: Center(child: Text(message))));
  }
}
