import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
//========================= variable ===========================================

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController loginTextControllerMobile = TextEditingController();
  final TextEditingController loginTextControllerPassword = TextEditingController();


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

  void login() {
    if(loginFormKey.currentState!.validate()){}
  }


}
