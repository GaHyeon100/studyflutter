import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  RxBool isLogined = false.obs;

  void authCheck() async {
    await Future.delayed(const Duration(microseconds: 10000));
    isLogined(true);
  }

  void logout() {
    isLogined(false);
  }
}
