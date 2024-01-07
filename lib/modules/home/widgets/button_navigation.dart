import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/modules/home/controller/home_controller.dart';
import 'package:iconsax/iconsax.dart';

class ButtonNavigation extends StatelessWidget {
  const ButtonNavigation({
    super.key, required this.controller,
  });
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // main container
          Container(
            width: double.infinity,
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.09),
                      blurRadius: 6,
                      offset: const Offset(0,-3)
                  ),
                ],
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(controller.navItems.length,
                      (index) => Padding(
                    padding:  EdgeInsets.only(left: index == 1? 50 : 0),
                    child: Icon(controller.navItems[index].icon),
                  )),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Color(0xFF3B7BE3),Color(0xFF29388B)],
                      begin: Alignment.topCenter,end: Alignment.bottomCenter
                  )
              ),
              child: const Icon(Iconsax.home_2,color: Colors.white,size: 28),
            ),
          )
        ],
      ),
    );
  }
}