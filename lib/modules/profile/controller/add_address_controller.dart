import 'package:flutter/cupertino.dart';
import 'package:flutter_grocery_store/backend/models/city.dart';
import 'package:flutter_grocery_store/backend/models/province.dart';
import 'package:flutter_grocery_store/backend/repository/profile_repository.dart';
import 'package:flutter_grocery_store/backend/response/perovince_response.dart';
import 'package:flutter_grocery_store/helper/widgets/snack_bars.dart';
import 'package:get/get.dart';

class AddAddressController extends GetxController {
//========================= variable ===========================================
  final ProfileRepository _repository = ProfileRepository();
  final TextEditingController titleText = TextEditingController();
  final TextEditingController addressText = TextEditingController();
  final TextEditingController postalCodeText = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool loading = false;
  ProvinceResponse? provinceList;
  Province? province;
  City? city;
  String? selectLocation;
//========================= methods ============================================
  Future<void> getAllProvince() async {
    final response = await _repository.getAllProvince();
    provinceList = response;
    update();
  }

  void onChangeProvince(Province value){
    province = value;
    update();
  }

  void onChangeCity(City value){
    city = value;
    update();
  }

  //#region Validate Forms Method
  String? validateAddressName(String? value){
    if(value == null || value.isEmpty) {
      return "لطفا یک نام معتبر وارد کنید!";
    }
    return null;
  }

  String? validateAddress(String? value){
    if(value == null || value.isEmpty) {
      return "لطفا یک آدرس معتبر وارد کنید!";
    }
    return null;
  }
  //#endregion

  void setLocation(String value) {
    selectLocation = value;
    update();
  }

  Future<void> addAddress() async {
    if(formKey.currentState!.validate()){
      if(city != null){
        loading = true;
        update();
        await _repository.addNewAddress(
           name: titleText.text,
           address: "${province?.name} - ${city?.name} - ${addressText.text}",
           cityId: city!.id!,
           postalCode: postalCodeText.text,
           latlong: selectLocation
       );
       loading = false;
       update();
       Get.back();
       showSnackBar(message: "آدرس با موفقیت اضافه شد", type: SnackBarType.success);
      } else {
        showSnackBar(message: "لطفا یک استان و شهر انتخاب کنید", type: SnackBarType.error);
      }
    }
  }

//========================= life cycle =========================================
  @override
  void onInit() {
    getAllProvince();
    super.onInit();
  }

}