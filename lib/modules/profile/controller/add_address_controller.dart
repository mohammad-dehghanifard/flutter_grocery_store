import 'package:flutter/cupertino.dart';
import 'package:flutter_grocery_store/backend/models/address.dart';
import 'package:flutter_grocery_store/backend/models/city.dart';
import 'package:flutter_grocery_store/backend/models/province.dart';
import 'package:flutter_grocery_store/backend/repository/profile_repository.dart';
import 'package:flutter_grocery_store/backend/response/province_response.dart';
import 'package:flutter_grocery_store/helper/widgets/snack_bars.dart';
import 'package:flutter_grocery_store/modules/profile/controller/address_controller.dart';
import 'package:get/get.dart';

class AddAddressController extends GetxController {
  AddAddressController({this.address});
//========================= variable ===========================================
  final Address? address;
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
    // select province and city for edit mode
    if(address != null){
      province = response.data!.firstWhere((provinceItem) => provinceItem.id == address!.provinceId);
      city = province!.cities!.firstWhere((cityItem) => cityItem.id == address!.cityId);
    }
    provinceList = response;
    update();
  }

  void onChangeProvince(Province value){
    province = value;
    city = null;
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

  Future<void> addOrEditAddress() async {
    if(formKey.currentState!.validate()){
      if(city != null){
        loading = true;
        update();
        await _repository.addOrEditAddress(
            id: address?.id,
           name: titleText.text,
           address: addressText.text,
           cityId: city!.id!,
           postalCode: postalCodeText.text,
           latlong: selectLocation
       );
       loading = false;
       update();
       Get.back();
       Get.find<AddressController>().getAllAddress();
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
    if(address != null){
      titleText.text = address!.title!;
      addressText.text = address!.address!;
      postalCodeText.text = address!.postalCode != null? address!.postalCode!.toString() : "" ;
      selectLocation = address!.latlong ?? "";
      update();
    }
    super.onInit();
  }

}