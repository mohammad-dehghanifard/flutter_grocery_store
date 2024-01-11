import 'package:flutter/cupertino.dart';
import 'package:flutter_grocery_store/backend/models/user_model.dart';
import 'package:flutter_grocery_store/backend/repository/profile_repository.dart';
import 'package:flutter_grocery_store/helper/widgets/snack_bars.dart';
import 'package:flutter_grocery_store/modules/profile/controller/profile_controller.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  EditProfileController(this.user);
//========================= variable ===========================================
  final User? user;
  final ProfileRepository _repository = ProfileRepository();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController userFullNameTextController = TextEditingController();
  final TextEditingController userMobileController = TextEditingController();
  final TextEditingController userOldPassTextController = TextEditingController();
  final TextEditingController userNewPassTextController = TextEditingController();
  bool loading = false;

//========================= methods ============================================
  void initialUserInfo(){
    userFullNameTextController.text = user!.name ?? "";
    userMobileController.text = user!.mobile ?? "";
  }

  //#region Validate Forms Method
  String? validateFullName(String? value){
    if(value == null || value.isEmpty) {
      return "لطفا یک نام معتبر وارد کنید!";
    }
    return null;
  }

  String? validateOldPassword(String? value){
    if(userNewPassTextController.text.isNotEmpty && value!.isEmpty) {
      return "لطفا رمز عبور خود را وارد کنید!";
    }
    return null;
  }

  //#endregion

  Future<void> editInformation() async{
    if(formKey.currentState!.validate()){
      loading = true;
      update();
      final response = await _repository.updateUser(
          name: userFullNameTextController.text,
          oldPassword: userOldPassTextController.text,
          newPassword: userNewPassTextController.text
      );
      loading = false;
      update();
      if(response){
        Get.find<ProfileController>().getUserInformation();
        Get.back();
        showSnackBar(message: 'اطلاعات با موفقیت ویرایش شد!', type: SnackBarType.success);
      }

    }
  }

//========================= life cycle =========================================
  @override
  void onInit() {
    initialUserInfo();
    super.onInit();
  }

}