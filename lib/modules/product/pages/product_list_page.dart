import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/helper/widgets/appbar_widget.dart';
import 'package:flutter_grocery_store/modules/product/controller/product_list_controller.dart';
import 'package:flutter_grocery_store/modules/product/widgets/category_text_list_widget.dart';
import 'package:flutter_grocery_store/modules/product/widgets/grid_product_list_widget.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: GetBuilder<ProductListController>(
          init: ProductListController(),
          builder: (controller) {
            return controller.categories == null || controller.products == null ? const Center(child: CircularProgressIndicator()) :Column(
              children: [
                const AppBarWidget(title: "محصولات"),
                const SizedBox(height: 20),
                // filter and search
                Row(
                  children: [
                    const SizedBox(width: 20),
                    // search
                    Expanded(
                        child: Container(
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
                        )
                    ),
                    const SizedBox(width: 20),
                    // filter
                    PopupMenuButton<Sort>(
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
                        ))

                  ],
                ),
                const SizedBox(height: 20),
                // category list
                CategoryTextListWidget(controller: controller),
                const SizedBox(height: 20),
                // product list
                Expanded(
                    child: GridProductListWidget(controller: controller)
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
