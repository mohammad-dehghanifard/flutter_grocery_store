import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/modules/product/controller/product_list_controller.dart';
import 'package:iconsax/iconsax.dart';

class ProductListSearchWidget extends StatelessWidget {
  const ProductListSearchWidget({super.key, required this.controller});
  final ProductListController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: const Color(0xFFEA5E24).withOpacity(0.19),
                blurRadius: 4,
                offset: const Offset(0,1)
            )
          ]
      ),
      child: TextFormField(
        controller: controller.searchText,
        onChanged: (value) => controller.searchProduct(value),
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 12),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            hintText: "نام محصول مورد نظر را بنویسید",
            hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
            suffixIcon: Icon(Iconsax.search_favorite)
        ),
      ),
    );
  }
}
