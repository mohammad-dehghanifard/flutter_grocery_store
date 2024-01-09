import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/modules/product/controller/product_list_controller.dart';
import 'package:iconsax/iconsax.dart';

class ProductListFilterMenuWidget extends StatelessWidget {
  const ProductListFilterMenuWidget({super.key, required this.controller});
  final ProductListController controller;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Sort>(
        onSelected: (sort) => controller.sort(sort),
        position: PopupMenuPosition.under,
        color: Colors.white,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
                value: Sort(orderColumn:"id",orderType: "DESC"),
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: Color(0xFFDEDEDE),width: 1))
                    ),
                    child: const Center(child: Text("جدیدترین ها")))),
            PopupMenuItem(
                value: Sort(orderColumn:"discount",orderType: "DESC"),
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: Color(0xFFDEDEDE),width: 1))
                    ),
                    child: const Center(child: Text("بیشترین تخفیف")))),
            PopupMenuItem(
                value: Sort(orderColumn: "price",orderType: "Asc"),
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: Color(0xFFDEDEDE),width: 1))
                    ),
                    child: const Center(child: Text("ارزانترین")))),
            PopupMenuItem(
                value: Sort(orderColumn:"price",orderType: "DESC"),
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: const Center(child: Text("گرانترین")))),
          ];
        },
        child: Container(
          padding: const EdgeInsets.all(7),
          margin: const EdgeInsets.only(left: 20),
          width: 40,
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
          child: const Icon(Iconsax.sort),
        ));
  }
}
