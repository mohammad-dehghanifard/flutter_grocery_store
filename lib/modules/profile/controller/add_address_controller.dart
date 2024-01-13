import 'package:flutter_grocery_store/backend/models/city.dart';
import 'package:flutter_grocery_store/backend/models/province.dart';
import 'package:flutter_grocery_store/backend/repository/profile_repository.dart';
import 'package:flutter_grocery_store/backend/response/perovince_response.dart';
import 'package:get/get.dart';

class AddAddressController extends GetxController {
//========================= variable ===========================================
  final ProfileRepository _repository = ProfileRepository();
  ProvinceResponse? provinceList;
  Province? province;
  City? city;
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

//========================= life cycle =========================================
  @override
  void onInit() {
    getAllProvince();
    super.onInit();
  }

}