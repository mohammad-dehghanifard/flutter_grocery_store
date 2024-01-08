import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/modules/home/controller/dashboard_cotroller.dart';
import 'package:flutter_grocery_store/modules/home/widgets/category_list_widget.dart';
import 'package:flutter_grocery_store/modules/home/widgets/product_list_widget.dart';
import 'package:flutter_grocery_store/modules/home/widgets/slider_widget.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
      init: DashBoardController(),
      builder: (controller) {
        return controller.dashboardData == null? const Center(child: CircularProgressIndicator()):  SingleChildScrollView(
          child: Column(
            children: [
              // sliders
              Padding(
                padding: const EdgeInsets.all(20),
                child: SliderWidget(imageList: controller.dashboardData!.sliders ?? []),
              ),
              const SizedBox(height: 20),
              // category list
              CategoryListWidget(categoryList: controller.dashboardData!.categories ?? []),
              const SizedBox(height: 15),
              // discountedProducts list
              ProductListWidget(listHeaderTitle: "تخفیف های شگفت انگیز",products: controller.dashboardData!.discountedProducts ?? []),
              const SizedBox(height: 15),
              // latestProducts
              ProductListWidget(listHeaderTitle: "جدیدترین محصولات",products: controller.dashboardData!.latestProducts ?? [])
            ],
          ),
        );
      }
    );
  }
}
