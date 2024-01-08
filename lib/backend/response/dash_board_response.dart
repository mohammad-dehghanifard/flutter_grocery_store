import 'package:flutter_grocery_store/backend/models/category.dart';
import 'package:flutter_grocery_store/backend/models/product.dart';

class DashboardResponse {
  List<String>? sliders;
  List<Category>? categories;
  List<Product>? discountedProducts;
  List<Product>? latestProducts;

  DashboardResponse(
      {this.sliders,
        this.categories,
        this.discountedProducts,
        this.latestProducts});

  DashboardResponse.fromJson(Map<String, dynamic> json) {
    sliders = json['sliders'].cast<String>();
    if (json['categories'] != null) {
      categories = <Category>[];
      json['categories'].forEach((v) {
        categories!.add(Category.fromJson(v));
      });
    }
    if (json['discounted_products'] != null) {
      discountedProducts = <Product>[];
      json['discounted_products'].forEach((v) {
        discountedProducts!.add(Product.fromJson(v));
      });
    }
    if (json['latest_products'] != null) {
      latestProducts = <Product>[];
      json['latest_products'].forEach((v) {
        latestProducts!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sliders'] = sliders;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (discountedProducts != null) {
      data['discounted_products'] =
          discountedProducts!.map((v) => v.toJson()).toList();
    }
    if (latestProducts != null) {
      data['latest_products'] =
          latestProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}




