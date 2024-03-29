import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/modules/home/controller/home_controller.dart';
import 'package:flutter_grocery_store/modules/home/pages/dashboard_page.dart';
import 'package:flutter_grocery_store/modules/home/widgets/button_navigation.dart';
import 'package:flutter_grocery_store/modules/home/widgets/home_app_bar_widget.dart';
import 'package:flutter_grocery_store/modules/profile/pages/bookmark_page.dart';
import 'package:flutter_grocery_store/modules/product/pages/cart_page.dart';
import 'package:flutter_grocery_store/modules/profile/pages/profile_page.dart';
import 'package:get/get.dart';

import 'category_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  //app bar
                  const HomeAppBarWidget(),
                  // pages
                  Expanded(
                    child: PageView(
                    controller: controller.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                    DashboardPage(),
                    CategoryPage(),
                    CartPage(),
                    BookMarkPage(),
                    ProfilePage()
                  ],
                )),
                // button navigation
                  ButtonNavigation(controller: controller)
                ],
              ),
            ),
          );
        },
    );
  }
}





