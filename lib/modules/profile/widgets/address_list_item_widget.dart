import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/backend/models/address.dart';
import 'package:flutter_grocery_store/helper/widgets/icon_button_widget.dart';
import 'package:flutter_grocery_store/modules/profile/pages/add_address_page.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddressListItemWidget extends StatelessWidget {
  const AddressListItemWidget({super.key, required this.address, required this.onDelete,this.selected = false});
  final Address address;
  final Function() onDelete;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 15),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: selected ? Theme.of(context).primaryColor : const Color(0xFFEBEBEB))),
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
                onTap:  onDelete,
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
  }
}