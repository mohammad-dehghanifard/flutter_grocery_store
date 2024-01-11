import 'package:flutter/cupertino.dart';
import 'package:flutter_grocery_store/backend/repository/product_repository.dart';
import 'package:flutter_grocery_store/backend/response/review_response.dart';
import 'package:flutter_grocery_store/helper/widgets/snack_bars.dart';
import 'package:get/get.dart';

class CommentController extends GetxController {
  CommentController({required this.productId});
//========================= variable ===========================================
  final int productId;
  final ProductRepository _repository = ProductRepository();
  final TextEditingController commentTextController = TextEditingController();
  final GlobalKey<FormState> commentFormKey = GlobalKey<FormState>();
  ReviewResponse? comments;
  int rating = 1;

//========================= methods ============================================

  Future<void> getAllProductComments() async {
  final response = await _repository.getAllProductReviews(id: productId);
  comments = response;
  update();
}

  String? validateCommentForm(String? value) {
    if(value == null || value.isEmpty){
      return "لطفا یک متن برای نظر خود وارد کنید!";
    }
  }

  void onChangeRate(double newRating) {
    rating = newRating.toInt();
    update();
  }

  Future<void> sendComment() async {
    if(commentFormKey.currentState!.validate()){
      final response = await _repository.addComment(productId: productId, rate: rating, text: commentTextController.text);
      if(response){
        getAllProductComments();
        Get.back();
        showSnackBar(message: "نظر شما با موفقیت ثبت شد!", type: SnackBarType.success);
      }else{
        showSnackBar(message: "خطایی به وجود آمده، مجددا امتحان کنید", type: SnackBarType.error);
      }
    }
  }

//========================= life cycle =========================================

@override
  void onInit() {
    getAllProductComments();
    super.onInit();
  }

}