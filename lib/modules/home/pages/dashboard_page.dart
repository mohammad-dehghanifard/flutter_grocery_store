import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/modules/home/controller/dashboard_cotroller.dart';
import 'package:flutter_grocery_store/modules/home/widgets/category_list_widget.dart';
import 'package:flutter_grocery_store/modules/home/widgets/product_list_widget.dart';
import 'package:flutter_grocery_store/modules/home/widgets/slider_widget.dart';
import 'package:flutter_grocery_store/modules/product/controller/product_list_controller.dart';
import 'package:get/get.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
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
              ProductListWidget(
                  listHeaderTitle: "تخفیف های شگفت انگیز",
                  sort: Sort(orderColumn:"discount",orderType: "DESC"),
                  products: controller.dashboardData!.discountedProducts ?? []),
              const SizedBox(height: 15),
              // latestProducts
              ProductListWidget(
                  listHeaderTitle: "جدیدترین محصولات",
                  sort: Sort(orderColumn:"id",orderType: "DESC"),
                  products: controller.dashboardData!.latestProducts ?? [])
            ],
          ),
        );
      }
    );
  }

  @override
  bool get wantKeepAlive => true;
}
