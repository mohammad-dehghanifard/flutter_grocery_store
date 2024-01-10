import 'package:flutter_grocery_store/backend/models/product.dart';
import 'package:flutter_grocery_store/backend/repository/product_repository.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  ProductDetailController({required this.productId});
//========================= variable ===========================================
  final int productId;
  final ProductRepository _productRepository = ProductRepository();
  Product? product;

//========================= methods ============================================

  Future<void> getProductDetail() async {
    final productResponse = await _productRepository.getProductDetail(id: productId);
    product = productResponse;
    update();
  }

//========================= life cycle =========================================
  @override
  void onInit() {
    getProductDetail();
    super.onInit();
  }

}