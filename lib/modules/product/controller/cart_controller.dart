import 'package:flutter_grocery_store/backend/repository/product_repository.dart';
import 'package:flutter_grocery_store/backend/response/cart_response.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
//========================= variable ===========================================
  final ProductRepository _productRepository = ProductRepository();
  CartResponse? cartResponse;
  bool loading = false;

//========================= methods ============================================
  Future<void> getAllCartItem() async {
    var response = await _productRepository.getAllProductInCartApi();
    cartResponse = response;
    update();
  }

  Future<void> changeCartItemCount({bool increment = true,bool delete = false,required int productId}) async {
    loading = true;
    update();
     await _productRepository.addProductToCartApi(productId: productId, increment: increment,delete: delete);
    getAllCartItem();
    loading = false;
    Get.find<CartController>().getAllCartItem();
    update();
  }


//========================= life cycle =========================================
  @override
  void onInit() {
    getAllCartItem();
    super.onInit();
  }

}