class Product {
  int? id;
  String? title;
  String? image;
  String? price;
  String? realPrice;
  int? discountPercent;

  Product(
      {this.id,
        this.title,
        this.image,
        this.price,
        this.realPrice,
        this.discountPercent});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    price = json['price'];
    realPrice = json['real_price'];
    discountPercent = json['discount_percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['price'] = price;
    data['real_price'] = realPrice;
    data['discount_percent'] = discountPercent;
    return data;
  }
}