import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_mvvm/mvvm_example/res/components/round_button.dart';
import 'package:provider_with_mvvm/mvvm_example/utils/routes/routes_name.dart';
import 'package:provider_with_mvvm/mvvm_example/utils/utils.dart';
import 'package:provider_with_mvvm/mvvm_example/view_model/auth_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  ValueNotifier<bool> obscurePassword = ValueNotifier(true);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    obscurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("build");
    }
    // provider
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    // media query
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.home);
                },
                icon: const Icon(Icons.arrow_back_outlined));
          },
        ),
        title: const Text("Login"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Card(
                elevation: 5,
                color: Colors.white,
                child: Container(
                  width: width * 0.95,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    controller: emailController,
                    focusNode: emailFocusNode,
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (value) {
                      // FocusScope.of(context).requestFocus(passwordFocusNode);
                      Utils.fieldFocusNode(
                          context: context,
                          currentFocus: emailFocusNode,
                          nextFocus: passwordFocusNode);
                    },
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: "Email",
                        hintText: "Enter email here",
                        prefixIcon: Icon(Icons.alternate_email)),
                  ),
                ),
              ),
            ),
            ValueListenableBuilder(
              valueListenable: obscurePassword,
              builder: (context, value, child) {
                return Card(
                  elevation: 5,
                  color: Colors.white,
                  child: Container(
                    width: width * .95,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                      controller: passwordController,
                      focusNode: passwordFocusNode,
                      obscureText: value,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                          labelText: "Password",
                          border: InputBorder.none,
                          hintText: "Enter password here",
                          prefixIcon: const Icon(Icons.lock_open_outlined),
                          suffixIcon: IconButton(
                              onPressed: () {
                                obscurePassword.value = !obscurePassword.value;
                              },
                              icon: obscurePassword.value
                                  ? const Icon(Icons.visibility_off_outlined)
                                  : const Icon(Icons.visibility_outlined))),
                    ),
                  ),
                );
              },
            ),
            RoundButton(
              title: 'Login',
              loading: authViewModel.loading,
              onPress: () {
                if (emailController.text.isEmpty) {
                  Utils.flushBarErrorMessage(
                      context: context, message: "Please enter email");
                } else if (passwordController.text.isEmpty) {
                  Utils.flushBarErrorMessage(
                      context: context, message: "Please enter password");
                } else if (passwordController.text.length < 6) {
                  Utils.flushBarErrorMessage(
                      context: context,
                      message: "Please enter 6 digit password");
                } else {
                  Map data = {
                    "email": emailController.text.toString(),
                    "password": passwordController.text.toString()
                  };
                  authViewModel.loginApi(data: data, context: context);
                }
              },
            ),
            SizedBox(height: height * 0.01),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.signup);
              },
              child: RichText(
                  text: const TextSpan(
                      text: "Don't have an account? ",
                      children: [
                        TextSpan(
                            text: "SignUp",
                            style: TextStyle(color: Colors.blue))
                      ],
                      style: TextStyle(color: Colors.black))),
            ),
          ],
        ),
      ),
    );
  }
}
