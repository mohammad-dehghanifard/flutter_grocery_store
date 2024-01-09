import 'package:flutter_grocery_store/backend/models/product.dart';

class ProductResponse {
  List<Product>? productList;

  ProductResponse({this.productList});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      productList = <Product>[];
      json['data'].forEach((v) {
        productList!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (productList != null) {
      data['data'] = productList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}