import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/modules/home/controller/home_controller.dart';
import 'package:flutter_grocery_store/modules/home/widgets/button_navigation.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            body: Column(
              children: [
                const Spacer(),
                // button navigation
                ButtonNavigation(controller: controller)
              ],
            ),
          );
        },
    );
  }
}


