import 'package:flutter/material.dart';
import 'package:provider_with_mvvm/mvvm_example/res/app_color.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const RoundButton(
      {super.key,
      required this.title,
      required this.loading,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return TextButton(
      onPressed: () {
        onPress();
      },
      child: Container(
        height: height * 0.06,
        width: width * 0.65,
        decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(20)),
        child: Center(
            child:loading ? const CircularProgressIndicator() : Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
