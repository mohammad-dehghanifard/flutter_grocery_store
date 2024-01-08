import 'package:flutter_grocery_store/backend/models/category.dart';

class CategoryResponse {
  List<Category>? categoryList;

  CategoryResponse({this.categoryList});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      categoryList = <Category>[];
      json['data'].forEach((v) {
        categoryList!.add(Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categoryList != null) {
      data['data'] = categoryList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


