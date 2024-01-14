import 'package:flutter_grocery_store/backend/repository/profile_repository.dart';
import 'package:flutter_grocery_store/backend/response/address_response.dart';
import 'package:flutter_grocery_store/helper/widgets/snack_bars.dart';
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

  Future<void> deleteAddress({required int id}) async {
    var response = await _repository.deleteAddress(id: id);
    if(response){
      addressResponse!.data!.removeWhere((address) => address.id == id );
      update();
      showSnackBar(message: "آدرس با موفقیت حذف شد!", type: SnackBarType.success);
    }
  }

//========================= life cycle =========================================
  @override
  void onInit() {
    getAllAddress();
    super.onInit();
  }
}