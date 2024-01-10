import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/helper/widgets/appbar_widget.dart';
import 'package:flutter_grocery_store/modules/product/controller/comment_controller.dart';
import 'package:flutter_grocery_store/modules/product/widgets/coment_bottom_sheet_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductCommentPage extends StatelessWidget {
  const ProductCommentPage({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommentController>(
        init: CommentController(productId: productId),
        builder:  (controller) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () => showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
                  builder: (context) => const CommentBottomSheet()),
              backgroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)
              ),
              child: const Icon(Iconsax.add,color: Colors.white),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
            body: SafeArea(
              child: Column(
                children: [
                  const AppBarWidget(title: "نظرات"),
                  // comment list
                  Expanded(
                      child:
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: controller.comments == null ? const Center(child: CircularProgressIndicator())
                            : ListView.builder(
                          itemCount: controller.comments!.data!.length,
                          itemBuilder: (context, index) {
                            var comment = controller.comments!.data![index];
                            return Container(
                              margin: const EdgeInsets.only(bottom: 14),
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Theme.of(context).dividerColor,width: 1)
                              ),
                              child:  Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // user name and rating bar
                                  Row(
                                    children: [
                                      Text(comment.user ?? "",style: const TextStyle(color: Color(0xFF8C8C8C),fontSize: 14)),
                                      const Spacer(),
                                      // rating bar
                                      Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: RatingBarIndicator(
                                          rating: comment.rate!.toDouble(),
                                          itemBuilder: (context, index) => const Icon(
                                            Iconsax.star1,
                                            color: Color(0xFFF4D42D),
                                          ),
                                          itemCount: 5,
                                          itemSize: 18.0,
                                          direction: Axis.horizontal,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(comment.date ?? "",style: const TextStyle(color: Color(0xFF8C8C8C),fontSize: 12)),
                                  const SizedBox(height: 10),
                                  Text(comment.comment?? "",style: const TextStyle(color: Color(0xFF252525),fontSize: 14)),
                                  // divider and answer
                                  Visibility(
                                    visible: comment.reply != null,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // divider
                                        Container(
                                          width: double.infinity,
                                          height: 1,
                                          margin: const EdgeInsets.symmetric(vertical: 10),
                                          color: Theme.of(context).dividerColor,
                                        ),
                                        // answer
                                        RichText(
                                            text: TextSpan(
                                                text: "پاسخ: ",
                                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color(0xFF8C8C8C),fontSize: 16),
                                                children: [
                                                  TextSpan(
                                                    text: "ممنون از نظر خوبتون",
                                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black,fontSize: 14),

                                                  )
                                                ]
                                            )
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      )),
                ],
              ),
            ),
          );
        },
    );
  }
}
