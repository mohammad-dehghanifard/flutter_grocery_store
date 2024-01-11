import 'package:flutter/cupertino.dart';
import 'package:flutter_grocery_store/backend/repository/product_repository.dart';
import 'package:flutter_grocery_store/backend/response/review_response.dart';
import 'package:get/get.dart';

class CommentController extends GetxController {
  CommentController({required this.productId});
//========================= variable ===========================================
  final int productId;
  final ProductRepository _repository = ProductRepository();
  final TextEditingController commentTextController = TextEditingController();
  ReviewResponse? comments;
  int rating = 1;

//========================= methods ============================================

Future<void> getAllProductComments() async {
  final response = await _repository.getAllProductReviews(id: productId);
  comments = response;
  update();
}

  void onChangeRate(double newRating) {
    rating = newRating.toInt();
    update();
  }

//========================= life cycle =========================================

@override
  void onInit() {
    getAllProductComments();
    super.onInit();
  }

}