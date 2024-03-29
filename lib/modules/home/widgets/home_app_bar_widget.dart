import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/modules/home/controller/home_controller.dart';
import 'package:flutter_grocery_store/modules/product/controller/cart_controller.dart';
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
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: AppBarButton(onTap: () {
                  Get.find<HomeController>().changePage(2);
                },icon: Iconsax.bag_2),
              ),
              GetBuilder<CartController>(
                init: CartController(),
                builder: (controller) {
                  return Container(
                    width: 16,
                    height: 16,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFF6060)
                    ),
                    child:  Center(
                        child: controller.cartResponse == null? const SizedBox(height: 8,width: 8,child: CircularProgressIndicator(strokeWidth: 1,color: Colors.white,))
                            :  Text(controller.cartResponse!.totalItems.toString(),style: const TextStyle(fontSize: 12,color: Colors.white),
                        )),
                  );
                }
              )
            ],
          ),
          const Spacer(),
          Image.asset("assets/images/logo_horiz.png",height: 45,),
          const Spacer(),
          // search
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: AppBarButton(onTap: () => Get.to(const ProductListPage()),icon: Iconsax.search_normal),
          ),
        ],
      ),
    );
  }
}