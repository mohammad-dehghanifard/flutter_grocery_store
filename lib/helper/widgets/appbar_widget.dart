import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});

    final String title;

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
          Center(child: Text(title,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w700))),
          // back btn
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                padding: const EdgeInsets.all(7),
                margin: const EdgeInsets.only(left: 20),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Theme.of(context).dividerColor)
                ),
                child: const Icon(Iconsax.arrow_left),
              ),
            ),
          )
        ],
      ),
    );
  }
}
