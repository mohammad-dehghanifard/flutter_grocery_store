import 'package:flutter/cupertino.dart';
import 'package:flutter_grocery_store/backend/models/user_model.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  EditProfileController(this.user);
//========================= variable ===========================================
  final User? user;
  final TextEditingController userFullNameTextController = TextEditingController();
  final TextEditingController userMobileController = TextEditingController();
  final TextEditingController userCurrentPassTextController = TextEditingController();
  final TextEditingController userNewPassTextController = TextEditingController();

//========================= methods ============================================
  void initialUserInfo(){
    userFullNameTextController.text = user!.name ?? "";
    userMobileController.text = user!.mobile ?? "";
  }

//========================= life cycle =========================================
  @override
  void onInit() {
    initialUserInfo();
    super.onInit();
  }

}