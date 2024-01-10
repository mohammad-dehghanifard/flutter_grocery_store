import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/helper/widgets/app_bar_button_widget.dart';
import 'package:flutter_grocery_store/helper/widgets/appbar_widget.dart';
import 'package:flutter_grocery_store/modules/product/controller/product_detail_controller.dart';
import 'package:flutter_grocery_store/modules/product/widgets/add_product_to_cart_widget.dart';
import 'package:flutter_grocery_store/modules/product/widgets/comment_button_widget.dart';
import 'package:flutter_grocery_store/modules/product/widgets/product_slider_widget.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<ProductDetailController>(
          init: ProductDetailController(productId: id),
          builder: (controller) {
            return Column(
              children: [
                AppBarWidget(action: AppBarButtonWidget(icon: Iconsax.heart,onTap: (){})),
                Expanded(
                    child: controller.product == null
                        ? const Center(child: CircularProgressIndicator())
                        : SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 ProductSliderWidget(imageList: controller.product!.gallery ?? []),
                                // category and realPrice
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Row(
                                    children: [
                                      // category
                                      Text("دسته بندی:  ${controller.product!.category}",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor)),
                                      const Spacer(),
                                       // real price and off tag
                                       Visibility(
                                         visible: controller.product!.discountPercent != 0,
                                         child: Row(
                                           children: [
                                             Text(controller.product!.realPrice.toString(),
                                                 style: const TextStyle(
                                                     fontSize: 14,
                                                     fontWeight: FontWeight.normal,
                                                     color: Color(0xFF8C8C8C),
                                                     decoration:
                                                     TextDecoration.lineThrough)),
                                             Container(
                                               margin: const EdgeInsets.only(right: 4),
                                               padding: const EdgeInsets.symmetric(
                                                   horizontal: 4),
                                               decoration: BoxDecoration(
                                                   color: const Color(0xFFFF3D3D),
                                                   borderRadius:
                                                   BorderRadius.circular(4)),
                                               child: const Text("30%",
                                                   style: TextStyle(
                                                       color: Colors.white,
                                                       fontSize: 9,
                                                       fontWeight: FontWeight.normal)),
                                             ),
                                           ],
                                         ),
                                       )
                                    ],
                                  ),
                                ),
                                // price and name
                                 Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: MediaQuery.sizeOf(context).width * 0.6,
                                        child: Text(controller.product!.title ?? "",
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF3A3A3A))),
                                      ),
                                      const Spacer(),
                                      Text(controller.product!.price ?? "",
                                          style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.normal,
                                              color: Color(0xFF3A3A3A))),
                                      const SizedBox(width: 4),
                                      const Text("تومان",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              color: Color(0xFF8C8C8C))),
                                    ],
                                  ),
                                ),
                                // description
                                 Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Text(
                                    controller.product!.description ?? "",
                                    style: const TextStyle(
                                        color: Color(0xFF8C8C8C),
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                // commentButton
                                CommentButtonWidget(reviewCount: controller.product!.reviewCount ?? 0)
                              ],
                            ),
                          ),
                  ),
                // add to cart button
                const AddProductToCartWidget()
              ],
            );
          }
        ),
      ),
    );
  }
}




