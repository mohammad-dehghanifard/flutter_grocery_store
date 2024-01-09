import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/helper/widgets/appbar_widget.dart';
import 'package:flutter_grocery_store/modules/product/controller/product_list_controller.dart';
import 'package:flutter_grocery_store/modules/product/widgets/category_text_list_widget.dart';
import 'package:flutter_grocery_store/modules/product/widgets/grid_product_list_widget.dart';
import 'package:flutter_grocery_store/modules/product/widgets/product_list_filter_menu_widget.dart';
import 'package:flutter_grocery_store/modules/product/widgets/product_list_search_widget.dart';
import 'package:get/get.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key,this.categoryId,this.sort});
  final int? categoryId;
  final Sort? sort;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: GetBuilder<ProductListController>(
          init: ProductListController(categoryDefaultId: categoryId,defaultSort: sort),
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
                        child: ProductListSearchWidget(controller: controller)
                    ),
                    const SizedBox(width: 20),
                    // filter
                    ProductListFilterMenuWidget(controller: controller),

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
