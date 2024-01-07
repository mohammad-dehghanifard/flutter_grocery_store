import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/modules/home/controller/home_controller.dart';
import 'package:flutter_grocery_store/modules/home/widgets/app_bar_button.dart';
import 'package:flutter_grocery_store/modules/home/widgets/button_navigation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

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
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // bag
                        AppBarButton(onTap: () {},icon: Iconsax.bag_2),
                        const Spacer(),
                        Image.asset("assets/images/logo_horiz.png",height: 45,),
                        const Spacer(),
                        // search
                        AppBarButton(onTap: () {},icon: Iconsax.search_normal),
                      ],
                    ),
                  ),
                  Expanded(
                    child: PageView(
                    controller: controller.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                    Container(color: Colors.redAccent),
                    Container(color: Colors.green),
                    Container(color: Colors.blue),
                    Container(color: Colors.orange),
                    Container(color: Colors.purple),
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



