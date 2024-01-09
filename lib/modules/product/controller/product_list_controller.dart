import 'package:flutter_grocery_store/backend/models/category.dart';
import 'package:flutter_grocery_store/backend/repository/product_repository.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {
//========================= variable ===========================================
  final ProductRepository _productRepository = ProductRepository();
  List<Category>? categories;
  int? categoryIndex;

//========================= methods ============================================

  Future<void> getAllCategories() async {
    final response = await _productRepository.getAllCategories();
    categories = response.categoryList;
    update();
  }

  void selectCategory(int id){
    categoryIndex = id;
    update();
  }

//========================= life cycle =========================================
  @override
  void onInit() {
    getAllCategories();
    super.onInit();
  }
}