import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/helper/widgets/button_widget.dart';
import 'package:flutter_grocery_store/modules/product/controller/comment_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CommentBottomSheet extends StatelessWidget {
  const CommentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.fromLTRB(30,30,30,MediaQuery.viewInsetsOf(context).bottom),
      child: GetBuilder<CommentController>(
        builder: (controller) {
          return  Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("ارسال نظر",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                // rating bar
                Center(
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: RatingBar.builder(
                      initialRating: controller.rating.toDouble(),
                      glowColor: Theme.of(context).primaryColor,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Iconsax.star1,
                        color: Color(0xFFF4D42D),
                      ),
                      onRatingUpdate: (rating) => controller.onChangeRate(rating),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // text field
                Form(
                  key: controller.commentFormKey,
                  child: TextFormField(
                    controller: controller.commentTextController,
                    maxLines: 5,
                    validator: controller.validateCommentForm,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(color: Color(0xFFE1E1E1))
                        ),
                        hintText: "نظر خود را وارد کنید",
                        hintStyle: const TextStyle(color: Color(0xFFB4B4B4),fontSize: 16,fontWeight: FontWeight.normal)
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // send comment btn
                ButtonWidget(
                    onPress: controller.sendComment,
                    text: "ارسال نظر"),
                const SizedBox(height: 30),
              ]
          );
        },
      )
    );
  }
}
