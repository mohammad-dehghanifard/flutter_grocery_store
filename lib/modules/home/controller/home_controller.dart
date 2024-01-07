import 'package:flutter/cupertino.dart';
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


//========================= methods ============================================

}


class MenuItem{
  MenuItem({required this.icon,this.selected = false});
  final IconData icon;
  final bool selected;
}