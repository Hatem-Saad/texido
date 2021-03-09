import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/config/routes.dart';
import 'package:texido_app/config/sizes.dart';
import '../views/auth/forgot_password.dart';
import '../views/auth/sign_in.dart';
import '../views/qr/qr_scanning/qr_scanning.dart';
import '../views/qr/qr_verified/qr_verified.dart';
import '../views/home/home.dart';
import '../views/splash/splash.dart';

// app colors
const Color appColor = Color(0xff1B2129);
const Color appBarColor = Color(0xff28303B);
const Color fieldColor = Color(0xff454C56);
const Color blackColor = Color(0xff000000);
const Color whiteColor = Color(0xffFFFFFF);
const Color greyColor01 = Color(0xff8EAABE);
const Color greenColor = Color(0xff5BB573);
const Color darkBlueColor = Color(0xff495670);
const Color greyColor02 = Color(0xff495670);
Color transparentColor = Colors.transparent;

const Color redColor = Color(0xff800120);
const Color pinkColor = Color(0xffFF8283);
const Color primaryColor = Color(0xffF2A94F);
const Color blueGrey = Color(0xff8EAABE);
const Color blueGrey2 = Color(0xff495670);
const Color blueGrey3 = Color(0xffEAEDF4);
const Color blueGrey4 = Color(0xff555F6C);
const Color blueGrey5 = Color(0xffD8DEE8);
const Color borderColor01 = Color(0xffC9DBE8);
const Color borderColor02 = Color(0xffE8E8E8);
const Color darkGrey01 = Color(0xff707070);
const Color darkGrey02 = Color(0xff6B7A8E);
const Color darkGrey03 = Color(0xff495670);
const Color darkGrey04 = Color(0xff3B3B3B);
const Color blackColor01 = Color(0xff2C2C2C);
const Color blackColor02 = Color(0xff20262F);
const Color blackColor03 = Color(0xff35353E);
const Color blackColor04 = Color(0xff141B25);
const Color blackColor05 = Color(0xff292929);
const Color blackColor06 = Color(0xff404041);
const Color greyColor03 = Color(0xffF7F7F7);
const Color greyColor04 = Color(0xffC1C1C1);
const Color greyColor05 = Color(0xff7E7E7E);
const Color greyColor06 = Color(0xff3B434E);
const Color greyColor07 = Color(0xff707070);
const Color hintColor = Color(0xff8EAABE);
const Color hintColor2 = Color(0xffA2A2A2);

// app vairables
double size = SizeConfig.defaultSize;
double a = size * 0.7;
double b = size * 0.8;
double c = size * 0.9;
double d = size;
double e = size * 0.6;
double f = size * 0.5;

// app pages
List<GetPage> getPages() {
  return [
    GetPage(
      name: Routes.splash,
      page: () => Splash(),
    ),
    GetPage(
      name: Routes.signIn,
      page: () => SignIn(),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: Routes.barScan,
      page: () => QRScanning(),
    ),
    GetPage(
      name: Routes.qrVerified,
      page: () => QRVerified(),
    ),
    GetPage(
      name: Routes.forgotPassword,
      page: () => ForgotPassword(),
    ),
  ];
}
