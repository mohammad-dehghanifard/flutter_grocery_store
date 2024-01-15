import 'package:flutter_grocery_store/backend/models/product.dart';
import 'package:flutter_grocery_store/backend/repository/product_repository.dart';
import 'package:flutter_grocery_store/backend/repository/profile_repository.dart';
import 'package:flutter_grocery_store/modules/product/controller/cart_controller.dart';
import 'package:flutter_grocery_store/modules/profile/controller/book_mark_controller.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  ProductDetailController({required this.productId});
//========================= variable ===========================================
  final int productId;
  final ProductRepository _productRepository = ProductRepository();
  final ProfileRepository _profileRepository = ProfileRepository();
  Product? product;
  bool loading = false;

//========================= methods ============================================

  Future<void> getProductDetail() async {
    final productResponse = await _productRepository.getProductDetail(id: productId);
    product = productResponse;
    update();
  }

  Future<void> addProductToBookMarkList() async {
    final response = await _profileRepository.addOrRemoveBookMark(id: productId);
    if(response){
      product!.bookMarked = !product!.bookMarked!;
      if(Get.isRegistered<BookMarkController>()){
        Get.find<BookMarkController>().getAllProduct();
      }
      update();
    }
  }

  Future<void> addToCart({bool increment = true}) async {
    loading = true;
    update();
    var response = await _productRepository.addProductToCartApi(productId: productId, increment: increment);
    product!.cartCount = response;
    loading = false;
    Get.find<CartController>().getAllCartItem();
    update();
  }

//========================= life cycle =========================================
  @override
  void onInit() {
    getProductDetail();
    super.onInit();
  }

}