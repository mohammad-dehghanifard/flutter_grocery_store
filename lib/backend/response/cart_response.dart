
import 'package:flutter_grocery_store/backend/models/cart_item.dart';

class CartResponse {
  int? totalItems;
  String? price;
  String? discountPrice;
  String? totalPrice;
  List<CartItems>? items;

  CartResponse(
      {this.totalItems,
        this.price,
        this.discountPrice,
        this.totalPrice,
        this.items});

  CartResponse.fromJson(Map<String, dynamic> json) {
    totalItems = json['total_items'];
    price = json['price'];
    discountPrice = json['discount_price'];
    totalPrice = json['total_price'];
    if (json['items'] != null) {
      items = <CartItems>[];
      json['items'].forEach((v) {
        items!.add(CartItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_items'] = totalItems;
    data['price'] = price;
    data['discount_price'] = discountPrice;
    data['total_price'] = totalPrice;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}




