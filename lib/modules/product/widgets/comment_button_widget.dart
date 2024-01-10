import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/modules/product/pages/product_comment_page.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CommentButtonWidget extends StatelessWidget {
  const CommentButtonWidget({
    super.key,
    this.reviewCount = 0
  });

  final int reviewCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: MaterialButton(
        onPressed: () => Get.to(const ProductCommentPage()),
        minWidth: MediaQuery.sizeOf(context).width,
        height: 50,
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xFFE1E1E1)),
            borderRadius: BorderRadius.circular(12)
        ),
        color: Colors.white,
        elevation: 0,
        child:  Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Iconsax.message_text_1,color: Color(0xFF8C8C8C),size: 21),
            const SizedBox(width: 8),
            const Text("نظرات",style: TextStyle(fontSize: 16)),
            const Spacer(),
            Text("${reviewCount.toString()}   نظر",style: const TextStyle(color: Color(0xFF8C8C8C))),
            const SizedBox(width: 8),
            const Icon(CupertinoIcons.chevron_left,color: Color(0xFF8C8C8C),size: 16)
          ],
        ),
      ),
    );
  }
}