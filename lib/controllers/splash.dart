import 'package:get/get.dart';
import 'package:texido_app/config/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 3), () {
      Get.offAndToNamed(Routes.signIn);
    });
    super.onInit();
  }
}
