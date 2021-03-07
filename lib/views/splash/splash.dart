import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/config/sizes.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/splash.dart';
import 'components.dart';

class Splash extends StatelessWidget {
  final controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: AppLogo(),
      ),
    );
  }
}
