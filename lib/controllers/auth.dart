import 'package:get/get.dart';
import 'package:texido_app/config/routes.dart';

class AuthController extends GetxController {
  RxBool radio = false.obs;
  RxBool passVisible = true.obs;
  RxBool loading = false.obs;
  RxBool success = false.obs;
  RxBool failed = false.obs;
  RxBool phoneValidate = false.obs;
  RxBool passwordValidate = false.obs;

  Future<void> signIn({String phone, String password}) {
    loading.value = true;
    Future.delayed(
      Duration(seconds: 2),
      () {
        if (phone == "123456789" && password == "123456") {
          success.value = true;
          loading.value = false;
          Future.delayed(Duration(seconds: 1), () {
            Get.offAndToNamed(Routes.home);
          });
        } else {
          failed.value = true;
          loading.value = false;
          Future.delayed(Duration(seconds: 1), () {
            loading.value = false;
            success.value = false;
            failed.value = false;
          });
        }
      },
    );
  }

  Future<void> forgotPassword(String phone) {
    loading.value = true;
    Future.delayed(
      Duration(seconds: 2),
      () {
        success.value = true;
        loading.value = false;
        Future.delayed(Duration(seconds: 1), () {
          Get.offAndToNamed(Routes.home);
        });
        Future.delayed(Duration(seconds: 1), () {
          loading.value = false;
          success.value = false;
          failed.value = false;
        });
      },
    );
  }
}
