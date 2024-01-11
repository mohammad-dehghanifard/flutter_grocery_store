import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'icon_button_widget.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, this.title, this.action});

    final String? title;
    final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 60,
      decoration:  BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6A6A6A).withOpacity(0.15),
            blurRadius: 6,
            offset: const Offset(0,1)
          )
        ]
      ),
      child:  Stack(
        children: [
          Center(child: Text(title ?? "",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w700))),
          // back btn
          Align(
            alignment: Alignment.centerLeft,
            child: IconButtonWidget(
              onTap: () => Get.back(),
              icon: Iconsax.arrow_left,
            )
          ),
          Align(
            alignment: Alignment.centerRight,
            child: action ?? Container(),
          )
        ],
      ),
    );
  }
}
