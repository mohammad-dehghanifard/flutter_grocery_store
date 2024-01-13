import 'package:flutter_grocery_store/backend/repository/profile_repository.dart';
import 'package:flutter_grocery_store/backend/response/perovince_response.dart';
import 'package:get/get.dart';

class AddAddressController extends GetxController {
//========================= variable ===========================================
  final ProfileRepository _repository = ProfileRepository();
  ProvinceResponse? province;
//========================= methods ============================================
  Future<void> getAllProvince() async {
    final response = await _repository.getAllProvince();
    province = response;
    update();
  }

//========================= life cycle =========================================
  @override
  void onInit() {
    getAllProvince();
    super.onInit();
  }

}