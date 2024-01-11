import 'package:flutter_grocery_store/helper/constants.dart';
import 'package:flutter_grocery_store/helper/user_helper.dart';
import 'package:flutter_grocery_store/modules/auth/pages/start_page.dart';
import 'package:flutter_grocery_store/modules/home/pages/home_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {

  SharedPreferences? prefs;

  Future<void> checkToken() async {
    prefs = await SharedPreferences.getInstance();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      final token = prefs!.getString(tokenKey);
      if(token != null){
        Get.put(UserHelper(token));
        Get.offAll(const HomePage());
        Get.find<SplashController>().dispose();
      }else{
        Get.offAll(const StartPage());
        Get.find<SplashController>().dispose();
      }
    });
  }

  @override
  void onInit() {
    checkToken();
    super.onInit();
  }
}