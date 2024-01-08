import 'package:flutter_grocery_store/backend/repository/product_repository.dart';
import 'package:flutter_grocery_store/backend/response/category_response.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  //========================= variable ===========================================
  final ProductRepository _productRepository = ProductRepository();
  CategoryResponse? categoryData;

//========================= methods ============================================

  Future<void> fetchAllCategory() async {
    categoryData = await _productRepository.getAllCategories();
    update();
  }

//========================= life cycle =========================================
  @override
  void onInit() {
    fetchAllCategory();
    super.onInit();
  }

}