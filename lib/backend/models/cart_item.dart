import 'product.dart';

class CartItems {
  int? count;
  Product? product;

  CartItems({this.count, this.product});

  CartItems.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    product =
    json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}