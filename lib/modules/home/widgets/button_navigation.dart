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
                    child: GestureDetector(
                        onTap: () => controller.changePage(index + 1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(controller.navItems[index].icon),
                            const SizedBox(height: 3),
                            // divider
                            AnimatedContainer(
                              width: index + 1 == controller.currentPage? 20 : 0,
                              height:  index + 1 == controller.currentPage? 2 : 0,
                              duration: const Duration(milliseconds: 300),
                              color: Theme.of(context).primaryColor,
                            )
                          ],
                        )),
                  )),
            ),
          ),
          // home btn
          Positioned(
            top: 0,
            child: GestureDetector(
              onTap: () => controller.changePage(0),
              child: Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [Color(0xFF3B7BE3),Color(0xFF29388B)],
                        begin: Alignment.topCenter,end: Alignment.bottomCenter
                    )
                ),
                child: const Icon(Iconsax.home_2,color: Colors.white,size: 28),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MenuItem{
  MenuItem({required this.icon,this.selected = false});
  final IconData icon;
  final bool selected;
}