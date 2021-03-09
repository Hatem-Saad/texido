import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/auth.dart';
import 'package:texido_app/widgets/custom_text.dart';
import 'components.dart';

// ignore: must_be_immutable
class SignIn extends StatelessWidget {
  final controller = Get.put(AuthController());
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size * 23),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size * 2),
                AppLogo(),
                SizedBox(height: size * 2),
                MediumText(text: "Sign In", size: d),
                SizedBox(height: size * 1.5),
                AuthFields(
                  phoneController: phoneController,
                  passwordController: passwordController,
                ),
                SizedBox(height: size * 0.5),
                ForgotPassword(),
                SizedBox(height: size),
                authButton(
                  label: "SIGN IN",
                  key: _formKey,
                  phoneController: phoneController,
                  passwordController: passwordController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
