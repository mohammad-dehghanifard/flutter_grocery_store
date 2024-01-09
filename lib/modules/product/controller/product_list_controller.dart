import 'package:flutter/cupertino.dart';
import 'package:flutter_grocery_store/backend/models/category.dart';
import 'package:flutter_grocery_store/backend/models/product.dart';
import 'package:flutter_grocery_store/backend/repository/product_repository.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {
  ProductListController({this.categoryDefaultId,this.defaultSort});
  int? categoryDefaultId;
  Sort? defaultSort;
//========================= variable ===========================================
  final ProductRepository _productRepository = ProductRepository();
  final TextEditingController searchText = TextEditingController();
  List<Category>? categories;
  List<Product>? products;
  int? categoryIndex;
  Sort? selectedSort;
//========================= methods ============================================

  Future<void> getAllCategories() async {
    final response = await _productRepository.getAllCategories();
    categories = response.categoryList;
    update();
  }

  Future<void> getProducts({String? keyword}) async {
    final response = await _productRepository.filterProducts(categoryId: categoryIndex,keyWord: keyword,orderColumn: selectedSort?.orderColumn,orderType: selectedSort?.orderType);
    products = response.productList;
    update();
  }

  void selectCategory(int id){
    categoryIndex = id;
    getProducts();
    update();
  }
  void searchProduct(String? value) => getProducts(keyword: value);
  void sort(Sort sort) {
    selectedSort = sort;
    update();
    getProducts();
  }


//========================= life cycle =========================================
  @override
  void onInit() {
    categoryIndex = categoryDefaultId;
    selectedSort = defaultSort;
    getProducts();
    getAllCategories();
    super.onInit();
  }
}

class Sort {
  Sort({required this.orderColumn,required this.orderType});
   String orderColumn;
   String orderType;
}