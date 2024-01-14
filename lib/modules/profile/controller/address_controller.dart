import 'package:flutter_grocery_store/backend/repository/profile_repository.dart';
import 'package:flutter_grocery_store/backend/response/address_response.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
//========================= variable ===========================================
  final ProfileRepository _repository = ProfileRepository();
  AddressResponse? addressResponse;

//========================= methods ============================================

  Future<void> getAllAddress() async {
    var response = await _repository.getAllAddress();
    addressResponse = response;
    update();
  }

//========================= life cycle =========================================
  @override
  void onInit() {
    getAllAddress();
    super.onInit();
  }
}