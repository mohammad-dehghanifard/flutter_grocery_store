import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/helper/widgets/button_widget.dart';

class AddProductToCartWidget extends StatelessWidget {
  const AddProductToCartWidget({
    super.key,
  });

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
                offset: const Offset(0,-3)
            )
          ],
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
          )
      ),
      child: Center(
        child: ButtonWidget(
            onPress: () {},
            text: "افرودن به سبد خرید"),
      ),
    );
  }
}