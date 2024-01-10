import 'package:flutter_grocery_store/backend/models/review.dart';

class ReviewResponse {
  List<Review>? data;

  ReviewResponse({this.data});

  ReviewResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Review>[];
      json['data'].forEach((v) {
        data!.add(Review.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


