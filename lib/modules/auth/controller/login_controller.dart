import 'package:flutter/cupertino.dart';
import 'package:flutter_grocery_store/backend/repository/auth_repository.dart';
import 'package:flutter_grocery_store/helper/constants.dart';
import 'package:flutter_grocery_store/modules/home/pages/home_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
//========================= variable ===========================================

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController loginTextControllerMobile = TextEditingController();
  final TextEditingController loginTextControllerPassword = TextEditingController();
  final AuthRepository _authRepository = AuthRepository();
  bool loading = false;
  SharedPreferences? prefs;

//========================= methods ============================================

  //#region Validate Forms Method

  String? validateMobileNumber(String? value){
    if(value == null || value.isEmpty) {
      return "لطفا یک شماره موبایل معتبر وارد کنید!";
    } else if(value.length < 11) {
      return "شماره موبایل باید 11 رقم باشد!";
    }
    return null;
  }

  String? validatePassword(String? value){
    if(value == null || value.isEmpty) {
      return "لطفا یک پسورد قوی وارد کنید!";
    } else if(value.length < 8) {
      return "پسورد شما باید شامل 8 کاراکتر یا بیشتر باشد";
    }
    return null;
  }

  //#endregion

  Future<void> initialPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }


  Future<void> login() async {
    if(loginFormKey.currentState!.validate()){
      loading = true;
      update();
      final res = await _authRepository.login(mobile: loginTextControllerMobile.text, password: loginTextControllerPassword.text);
      // save token
      if(res != null){
        prefs!.setString(tokenKey, res.token!);
        Get.to(const HomePage());
      }
      loading = false;
      update();
    }
  }


//========================= life cycle =========================================

  @override
  void onInit() {
    initialPrefs();
    super.onInit();
  }

}
