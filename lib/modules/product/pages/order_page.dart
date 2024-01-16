import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/helper/widgets/appbar_widget.dart';
import 'package:flutter_grocery_store/helper/widgets/button_widget.dart';
import 'package:flutter_grocery_store/modules/product/controller/order_controller.dart';
import 'package:flutter_grocery_store/modules/product/widgets/shipping_radio_button_widget.dart';
import 'package:flutter_grocery_store/modules/profile/pages/add_address_page.dart';
import 'package:flutter_grocery_store/modules/profile/widgets/address_list_item_widget.dart';
import 'package:get/get.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBarWidget(title: "تکمیل سفارش"),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text("آدرس خود را انتخاب کنید",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16)),
            ),
            GetBuilder<OrderController>(
              init: OrderController(),
              builder: (controller) {
                return Expanded(
                    child: controller.addressResponse == null? const Center(child: CircularProgressIndicator())
                        : SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // address List
                      Column(
                        children: List.generate(controller.addressResponse!.data!.length,
                        (index) => AddressListItemWidget(
                            address: controller.addressResponse!.data![index],
                            onDelete: ()=>controller.deleteAddress(id: controller.addressResponse!.data![index].id!))),
                      ),
                      // add address button
                      ButtonWidget(
                          onPress: () => Get.to(const AddAddressPage()),
                          hasBorder: true,
                          showIcon: true,
                          text: "افزودن آدرس"
                      ),
                      const SizedBox(height: 20),

                      const Text("شیوه ارسال را انتخاب کنید",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16)),
                      // Shipping select
                      const ShippingRadioButtonWidget()
                    ],
                  ),
                ));
              }
            )
          ],
        ),
      ),
    );
  }
}
