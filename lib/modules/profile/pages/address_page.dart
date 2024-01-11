import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/helper/widgets/appbar_widget.dart';
import 'package:flutter_grocery_store/helper/widgets/button_widget.dart';
import 'package:flutter_grocery_store/helper/widgets/icon_button_widget.dart';
import 'package:flutter_grocery_store/modules/profile/pages/add_address_page.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarWidget(title: "آدرس ها"),
            // address list
            Expanded(
                child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 15),
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFEBEBEB))),
                  child: Column(
                    children: [
                      // title
                      Row(
                        children: [
                          const Text("خانه", style: TextStyle(fontWeight: FontWeight.bold)),
                          const Spacer(),
                          // buttons
                          IconButtonWidget(
                            icon: Iconsax.edit,
                            onTap: () {},
                            width: 35,
                            iconColor: Theme.of(context).primaryColor,
                            height: 35,
                            marginLeft: 10,
                            marginRight: 10,
                            iconSize: 18,
                            radius: 8,
                          ),
                          IconButtonWidget(
                            icon: Iconsax.trash,
                            onTap: () {},
                            width: 35,
                            iconColor: Theme.of(context).primaryColor,
                            height: 35,
                            marginLeft: 10,
                            marginRight: 0,
                            iconSize: 18,
                            radius: 8,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // address
                      const Text(
                          "-8احمد آباد - بین پاستور و قائم - ساختمان هدایت طبقه دوم -واحد",
                        style: TextStyle(color: Color(0xFF8C8C8C)),
                      ),
                      // postal code
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("کد پستی:  ", style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(
                            "۲۳۴۵۶۷۸",
                            style: TextStyle(color: Color(0xFF8C8C8C)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                );
              },
            )),
            //add address button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ButtonWidget(
                  onPress: () => Get.to(const AddAddressPage()),
                  hasBorder: true,
                  text: "افزودن آدرس"
              ),
            ),

            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
