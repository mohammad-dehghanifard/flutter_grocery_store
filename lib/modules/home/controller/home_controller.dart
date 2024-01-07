import 'package:flutter/cupertino.dart';
import 'package:flutter_grocery_store/modules/home/widgets/button_navigation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomeController extends GetxController {

//========================= variable ===========================================
  final List<MenuItem> navItems = [
    MenuItem(icon: Iconsax.element_3),
    MenuItem(icon: Iconsax.shopping_cart),
    MenuItem(icon: Iconsax.heart),
    MenuItem(icon: Iconsax.user),
  ];
  final PageController pageController = PageController();
  int currentPage = 0;


//========================= methods ============================================
  void changePage(int page){
    pageController.animateToPage(page, duration: const Duration(milliseconds: 700), curve: Curves.ease);
    currentPage = page;
    update();
  }

}


