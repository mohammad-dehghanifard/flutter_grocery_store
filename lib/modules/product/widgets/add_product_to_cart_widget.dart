import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/helper/widgets/button_widget.dart';
import 'package:flutter_grocery_store/modules/product/controller/product_detail_controller.dart';
import 'package:iconsax/iconsax.dart';

class AddProductToCartWidget extends StatelessWidget {
  const AddProductToCartWidget({
    super.key,
    required this.controller,
  });

  final ProductDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 90,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.09),
                blurRadius: 6,
                offset: const Offset(0, -3))
          ],
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
          )),
      child: Center(
        child: controller.product!.cartCount == 0
            ? ButtonWidget(
                onPress: () => controller.addToCart(),
                loading: controller.loading,
                text: "افرودن به سبد خرید")
            : ButtonWidget(
                onPress: () {},
                loading: controller.loading,
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () => controller.addToCart(),
                        child: const Icon(Iconsax.add, color: Colors.white)),
                    Text(
                      controller.product!.cartCount.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    GestureDetector(
                        onTap: () => controller.addToCart(increment: false),
                        child: Icon(
                            controller.product!.cartCount == 1
                                ? Iconsax.trash
                                : Iconsax.minus,
                            color: Colors.white)),
                  ],
                ),
              ),
      ),
    );
  }
}
