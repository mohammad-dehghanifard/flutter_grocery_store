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
      // payment button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: ButtonWidget(
          onPress: () {},
          height: 52,
          text: "پرداخت آنلاین"),
      ),
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
                      const ShippingRadioButtonWidget(),
                      const SizedBox(height: 20),
                      // price card
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: const Color(0xFFEBEBEB),width: 1),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                                color: Theme.of(context).primaryColor.withOpacity(0.15),
                                blurRadius: 3,offset: const Offset(0,1)
                            )
                          ],
                        ),
                        child:  Column(
                          children: [
                            // shipping price
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  Text( "هزینه ارسال",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xFF8C8C8C))),
                                  Spacer(),
                                  Text( "۲۰,۰۰۰",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  SizedBox(width: 4),
                                  Text("تومان",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xFF8C8C8C))),

                                ],
                              ),
                            ),
                            const SizedBox(height: 6),
                            // price
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  Text( "مبلغ:",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xFF8C8C8C))),
                                  Spacer(),
                                  Text( "۱۱۰,۰۰۰",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  SizedBox(width: 4),
                                  Text("تومان",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xFF8C8C8C))),

                                ],
                              ),
                            ),
                            // discount
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  Text( "مبلغ تخفیف:",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xFF8C8C8C))),
                                  Spacer(),
                                  Text( "۱۰,۰۰۰",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color((0xFFFC7878))
                                      )),
                                  SizedBox(width: 4),
                                  Text("تومان",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xFF8C8C8C))),

                                ],
                              ),
                            ),
                            // final price
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 6),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(top: BorderSide(color: Theme.of(context).dividerColor)),
                                  borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(16),
                                      bottomLeft: Radius.circular(16)
                                  )
                              ),
                              child:  const Row(
                                children: [
                                  Text( "مبلغ:",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xFF8C8C8C))),
                                  Spacer(),
                                  Text( "۱۲۰,۰۰۰",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  SizedBox(width: 4),
                                  Text("تومان",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xFF8C8C8C))),

                                ],
                              ),
                            )
                          ],
                        ),
                      ),
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
