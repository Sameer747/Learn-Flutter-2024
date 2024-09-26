import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_mvvm/mvvm_example/res/components/round_button.dart';
import 'package:provider_with_mvvm/mvvm_example/utils/routes/routes_name.dart';
import 'package:provider_with_mvvm/mvvm_example/utils/utils.dart';
import 'package:provider_with_mvvm/mvvm_example/view_model/auth_view_model.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  ValueNotifier<bool> obscurePassword = ValueNotifier(true);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    obscurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    // final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
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
                    controller: _emailController,
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
                      controller: _passwordController,
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
            Consumer<AuthViewModel>(
              builder: (context, authProvider, child) {
                return RoundButton(
                  title: 'Sign Up',
                  loading: authProvider.loading,
                  onPress: () {
                    if (_emailController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          context: context, message: "Please enter email");
                    } else if (_passwordController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          context: context, message: "Please enter password");
                    } else if (_passwordController.text.length < 6) {
                      Utils.flushBarErrorMessage(
                          context: context,
                          message: "Please enter 6 digit password");
                    } else {
                      Map data = {
                        "email": _emailController.text.toString(),
                        "password": _passwordController.text.toString()
                      };
                      authProvider.signUpApi(data: data, context: context);
                    }
                  },
                );
              },
            ),
            SizedBox(height: height * 0.01),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.login);
              },
              child: RichText(
                  text: const TextSpan(
                      text: "Already have an account? ",
                      children: [
                        TextSpan(
                            text: "Login", style: TextStyle(color: Colors.blue))
                      ],
                      style: TextStyle(color: Colors.black))),
            )
          ],
        ),
      ),
    );
  }
}
