import 'package:flutter_grocery_store/backend/models/category.dart';
import 'package:flutter_grocery_store/backend/models/product.dart';
import 'package:flutter_grocery_store/backend/repository/product_repository.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {
//========================= variable ===========================================
  final ProductRepository _productRepository = ProductRepository();
  List<Category>? categories;
  List<Product>? products;
  int? categoryIndex;

//========================= methods ============================================

  Future<void> getAllCategories() async {
    final response = await _productRepository.getAllCategories();
    categories = response.categoryList;
    update();
  }

  Future<void> getProducts() async {
    final response = await _productRepository.filterProducts(categoryId: categoryIndex);
    products = response.productList;
    update();
  }

  void selectCategory(int id){
    categoryIndex = id;
    getProducts();
    update();
  }

//========================= life cycle =========================================
  @override
  void onInit() {
    getProducts();
    getAllCategories();
    super.onInit();
  }
}