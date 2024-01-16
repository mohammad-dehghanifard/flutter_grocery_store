import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/backend/models/address.dart';
import 'package:flutter_grocery_store/helper/widgets/appbar_widget.dart';
import 'package:flutter_grocery_store/helper/widgets/button_widget.dart';
import 'package:flutter_grocery_store/modules/profile/controller/address_controller.dart';
import 'package:flutter_grocery_store/modules/profile/pages/add_address_page.dart';
import 'package:flutter_grocery_store/modules/profile/widgets/address_list_item_widget.dart';
import 'package:get/get.dart';

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
                    return AddressListItemWidget(address: address, onDelete: () => controller.deleteAddress(id: address.id!));
                  },
                )),
                //add address button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ButtonWidget(
                      onPress: () => Get.to(const AddAddressPage()),
                      hasBorder: true,
                      showIcon: true,
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



