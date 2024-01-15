import 'package:flutter_grocery_store/backend/repository/product_repository.dart';
import 'package:flutter_grocery_store/backend/response/cart_response.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
//========================= variable ===========================================
  final ProductRepository _productRepository = ProductRepository();
  CartResponse? cartResponse;

//========================= methods ============================================
  Future<void> getAllCartItem() async {
    var response = await _productRepository.getAllProductInCartApi();
    cartResponse = response;
    update();
  }


//========================= life cycle =========================================
  @override
  void onInit() {
    getAllCartItem();
    super.onInit();
  }

}