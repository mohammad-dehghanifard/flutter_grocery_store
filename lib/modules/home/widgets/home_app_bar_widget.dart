import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/modules/product/pages/product_list_page.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'app_bar_button.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // bag
          AppBarButton(onTap: () {},icon: Iconsax.bag_2),
          const Spacer(),
          Image.asset("assets/images/logo_horiz.png",height: 45,),
          const Spacer(),
          // search
          AppBarButton(onTap: () => Get.to(const ProductListPage()),icon: Iconsax.search_normal),
        ],
      ),
    );
  }
}