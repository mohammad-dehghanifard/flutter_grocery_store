import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/backend/models/address.dart';
import 'package:flutter_grocery_store/helper/widgets/appbar_widget.dart';
import 'package:flutter_grocery_store/helper/widgets/button_widget.dart';
import 'package:flutter_grocery_store/modules/product/controller/cart_controller.dart';
import 'package:flutter_grocery_store/modules/product/controller/order_controller.dart';
import 'package:flutter_grocery_store/modules/product/widgets/shipping_radio_button_widget.dart';
import 'package:flutter_grocery_store/modules/profile/pages/add_address_page.dart';
import 'package:flutter_grocery_store/modules/profile/widgets/address_list_item_widget.dart';
import 'package:get/get.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<OrderController>(
      init: OrderController(),
      builder: (controller) {
        return Scaffold(
          // payment button
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(20),
            child: ButtonWidget(
              onPress: () => controller.navigateToPaymentPage(),
              height: 52,
              text: "پرداخت آنلاین"),
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppBarWidget(title: "تکمیل سفارش"),
                Expanded(
                  child: controller.addressResponse == null? const Center(child: CircularProgressIndicator())
                      : SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Text("آدرس خود را انتخاب کنید",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16)),
                        ),
                        // address List
                        Column(
                          children: List.generate(controller.addressResponse!.data!.length,
                                  (index) {
                                final Address address = controller.addressResponse!.data![index];
                                return GestureDetector(
                                  onTap: () => controller.onChangeAddress(address),
                                  child: AddressListItemWidget(
                                      address: address,
                                      selected: address.id == controller.selectedAddress?.id,
                                      onDelete: () => controller.deleteAddress(id: address.id!)),
                                );
                              }),
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
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    const Text( "هزینه ارسال",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                            color: Color(0xFF8C8C8C))),
                                    const Spacer(),
                                    Text( controller.shippingMethod?.price ?? "0",
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    const SizedBox(width: 4),
                                    const Text("تومان",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Color(0xFF8C8C8C))),

                                  ],
                                ),
                              ),
                              const SizedBox(height: 6),
                              // price
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    const Text( "مبلغ:",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                            color: Color(0xFF8C8C8C))),
                                    const Spacer(),
                                    Text( Get.find<CartController>().cartResponse!.price!,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    const SizedBox(width: 4),
                                    const Text("تومان",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Color(0xFF8C8C8C))),

                                  ],
                                ),
                              ),
                              // discount
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    const Text( "مبلغ تخفیف:",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                            color: Color(0xFF8C8C8C))),
                                    const Spacer(),
                                    Text( Get.find<CartController>().cartResponse!.discountPrice!,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color((0xFFFC7878))
                                        )),
                                    const SizedBox(width: 4),
                                    const Text("تومان",
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
                                child:   Row(
                                  children: [
                                    const Text( "مبلغ کل :",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                            color: Color(0xFF8C8C8C))),
                                    const Spacer(),
                                    Text( controller.calculateTotalPrice(),
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    const SizedBox(width: 4),
                                    const Text("تومان",
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
                  )),

              ],
            ),
          ),
        );
      }
    );
  }
}
