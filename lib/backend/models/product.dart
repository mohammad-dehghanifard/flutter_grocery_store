class Product {
  int? id;
  String? title;
  String? category;
  String? description;
  List<String>? gallery;
  int? reviewCount;
  String? image;
  String? price;
  bool? bookMarked;
  String? realPrice;
  int? discountPercent;
  int? cartCount;
  int? count;

  Product(
      {this.id,
        this.title,
        this.description,
        this.category,
        this.gallery,
        this.reviewCount,
        this.image,
        this.bookMarked,
        this.price,
        this.realPrice,
        this.cartCount,
        this.discountPercent});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json["description"];
    bookMarked = json['bookmarked'];
    if(json['gallery'] != null) {
      gallery = json['gallery'].cast<String>();
    }
    category = json['category'];
    reviewCount = json["reviews_count"];
    cartCount = json["cart_count"];
    image = json['image'];
    price = json['price'];
    count = json['count'];
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