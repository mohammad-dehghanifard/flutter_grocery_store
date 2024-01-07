import 'package:flutter/cupertino.dart';
import 'package:flutter_grocery_store/backend/repository/auth_repository.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
//========================= variable ===========================================

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController textControllerName = TextEditingController();
  final TextEditingController textControllerMobile = TextEditingController();
  final TextEditingController textControllerPassword = TextEditingController();
  final TextEditingController textControllerRepeatPass = TextEditingController();
  final AuthRepository _authRepository = AuthRepository();


//========================= methods ============================================

  //#region Validate Forms Method
  String? validateFullName(String? value){
    if(value == null || value.isEmpty) {
      return "لطفا یک نام معتبر وارد کنید!";
    }
    return null;
  }

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

  String? validateRepeatPassword(String? value){
    if(value == null || value.isEmpty) {
      return "لطفا تکرار رمز عبور خود را وارد کنید!";
    } else if (value != textControllerPassword.text){
      return "تکرار کلمه عبورد با رمز عبور وارشده مطابقت ندارد!";
    }
    return null;
  }
  //#endregion

  void register() {
    if(formKey.currentState!.validate()) {
      _authRepository.register(
          fullName: textControllerName.text,
          mobile: textControllerMobile.text,
          password: textControllerPassword.text,
          confirmPass: textControllerRepeatPass.text);
    }
  }

}


