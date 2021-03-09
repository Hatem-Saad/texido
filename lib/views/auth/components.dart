import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:texido_app/config/routes.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/constants/asset_path.dart';
import 'package:texido_app/controllers/auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:texido_app/widgets/custom_field.dart';
import 'package:texido_app/widgets/custom_text.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          SvgPicture.asset(
            splash,
            height: size * 8,
          ),
          SizedBox(height: size),
          MediumText(
            text: "Redefining elegance!",
            size: a,
            color: blueGrey,
          ),
        ],
      ),
    );
  }
}

class AuthFields extends StatelessWidget {
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  AuthFields({this.phoneController, this.passwordController});
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          phoneField(phoneController),
          SizedBox(height: size * 1.5),
          passwordField(passwordController),
        ],
      ),
    );
  }

  Widget phoneField(TextEditingController phoneController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MediumText(text: "Mobile number", size: a),
        SizedBox(height: size * 0.5),
        textField(
          hint: "Enter your number",
          vertical: size,
          fieldController: phoneController,
          prefix: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: size * 1.1),
              Text(
                "+966",
                style: TextStyle(
                  color: redColor,
                  fontSize: size * 1.1,
                ),
              ),
              SizedBox(width: size),
            ],
          ),
          validate: (newValue) {
            if (newValue.isEmpty) return "Please enter your number";
            if (newValue.length < 9) return "Invalid phone number";
          },
          onSubmit: (newValue) {
            controller.phoneValidate.value = true;
          },
          autoValidate: controller.phoneValidate.value,
        ),
      ],
    );
  }

  Widget passwordField(TextEditingController passwordController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MediumText(text: "Password", size: a),
        SizedBox(height: size * 0.5),
        textField(
          hint: "Enter your password",
          vertical: size,
          fieldController: passwordController,
          suffix: IconButton(
            icon: Icon(
              controller.passVisible.value
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: hintColor,
              size: size * 1.5,
            ),
            onPressed: () {
              controller.passVisible.value = !controller.passVisible.value;
            },
          ),
          obscureText: controller.passVisible.value ? false : true,
          validate: (newValue) {
            if (newValue.isEmpty)
              return "Please enter your password";
            else if (newValue.length < 5) return "Too short password";
          },
          onSubmit: (newValue) {
            controller.passwordValidate.value = true;
          },
          autoValidate: controller.passwordValidate.value,
        ),
      ],
    );
  }
}

class ForgotPassword extends StatelessWidget {
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Theme(
          data: ThemeData(
            unselectedWidgetColor: redColor,
          ),
          child: Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Obx(
                  () => Checkbox(
                    value: controller.radio.value,
                    activeColor: redColor,
                    onChanged: (bool newVal) {
                      controller.radio.value = newVal;
                    },
                  ),
                ),
              ),
              RegularText(
                text: "Remember me",
                size: a,
                color: redColor,
              ),
            ],
          ),
        ),
        FlatButton(
          onPressed: () => Get.toNamed(Routes.forgotPassword),
          child: SemiBoldText(
            text: "Forgot password?",
            size: a,
            color: redColor,
          ),
        ),
      ],
    );
  }
}

Widget authButton({
  String label,
  TextEditingController phoneController,
  TextEditingController passwordController,
  GlobalKey<FormState> key,
}) {
  final controller = Get.find<AuthController>();
  return Obx(
    () => FlatButton(
      onPressed: () {
        Get.toNamed(Routes.home);
        // if (key.currentState.validate()) {
        //   if (label == "SIGN IN")
        //     controller.signIn(
        //       phone: phoneController.text,
        //       password: passwordController.text,
        //     );
        //   else
        //     controller.forgotPassword(phoneController.text);
        // }
      },
      padding: EdgeInsets.all(0.0),
      child: Container(
        height: size * 3.1,
        width: Get.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: controller.success.value ? greenColor : redColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: (controller.loading.value == false &&
                controller.success.value == false &&
                controller.failed.value == false)
            ? SemiBoldText(text: label, size: c, color: whiteColor)
            : (controller.loading.value)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SemiBoldText(text: "Loading", size: c, color: whiteColor),
                      SpinKitThreeBounce(
                        color: whiteColor,
                        size: size * 2,
                      ),
                    ],
                  )
                : (controller.success.value)
                    ? SemiBoldText(text: "Succeed", size: c, color: whiteColor)
                    : SemiBoldText(text: "Failed", size: c, color: whiteColor),
      ),
    ),
  );
}

class GoToLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MediumText(
          text: "Back To ",
          size: b,
        ),
        GestureDetector(
          child: MediumText(
            text: "login",
            size: b,
            color: redColor,
          ),
          onTap: () => Get.offAndToNamed(Routes.signIn),
        )
      ],
    );
  }
}
