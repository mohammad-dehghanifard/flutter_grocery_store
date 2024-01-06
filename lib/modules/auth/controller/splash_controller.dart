import 'package:flutter_grocery_store/modules/auth/pages/start_page.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Get.offAll(const StartPage());
      Get.find<SplashController>().dispose();
    });
    super.onInit();
  }
}