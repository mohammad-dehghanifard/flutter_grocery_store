import 'package:flutter_grocery_store/backend/repository/profile_repository.dart';
import 'package:flutter_grocery_store/backend/response/product_response.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class BookMarkController extends GetxController {
//========================= variable ===========================================
  final ProfileRepository _repository = ProfileRepository();
  ProductResponse? productResponse;

//========================= methods ============================================
  Future<void> getAllProduct() async {
    var response = await _repository.getAllBookmark();
    productResponse = response;
    update();
  }


//========================= life cycle =========================================
  @override
  void onInit() {
    getAllProduct();
    super.onInit();
  }
}