import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/backend/models/address.dart';
import 'package:flutter_grocery_store/helper/widgets/appbar_widget.dart';
import 'package:flutter_grocery_store/helper/widgets/button_widget.dart';
import 'package:flutter_grocery_store/helper/widgets/icon_button_widget.dart';
import 'package:flutter_grocery_store/modules/profile/controller/address_controller.dart';
import 'package:flutter_grocery_store/modules/profile/pages/add_address_page.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<AddressController>(
          init: AddressController(),
          builder: (controller) {
            return Column(
              children: [
                const AppBarWidget(title: "آدرس ها"),
                // address list
                Expanded(
                    child: controller.addressResponse == null? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  itemCount: controller.addressResponse!.data!.length,
                  itemBuilder: (context, index) {
                    final Address address = controller.addressResponse!.data![index];
                    return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(bottom: 15),
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFEBEBEB))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // title
                          Row(
                            children: [
                              Text(address.title ?? "", style: const TextStyle(fontWeight: FontWeight.bold)),
                              const Spacer(),
                              // edit buttons
                              IconButtonWidget(
                                icon: Iconsax.edit,
                                onTap: () => Get.to(AddAddressPage(address: address)),
                                width: 35,
                                iconColor: Theme.of(context).primaryColor,
                                height: 35,
                                marginLeft: 10,
                                marginRight: 10,
                                iconSize: 18,
                                radius: 8,
                              ),
                              // delete button
                              IconButtonWidget(
                                icon: Iconsax.trash,
                                onTap: () => controller.deleteAddress(id: address.id!),
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
                           Text(address.address ?? "",style: const TextStyle(color: Color(0xFF8C8C8C)),
                          ),
                          // postal code
                          Visibility(
                            visible: address.postalCode != null,
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text("کد پستی:  ", style: TextStyle(fontWeight: FontWeight.bold)),
                                Text(
                                  address.postalCode.toString(),
                                  style: const TextStyle(color: Color(0xFF8C8C8C)),
                                ),
                              ],
                            ),
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
            );
          }
        ),
      ),
    );
  }
}
