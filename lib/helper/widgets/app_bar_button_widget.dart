import 'package:flutter/material.dart';

class AppBarButtonWidget extends StatelessWidget {
  const AppBarButtonWidget({super.key, required this.icon, required this.onTap,this.marginLeft = 20,this.marginRight = 20});
  final IconData icon;
  final Function() onTap;
  final double marginLeft;
  final double marginRight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(7),
        margin:  EdgeInsets.only(left: marginLeft,right: marginRight),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Theme.of(context).dividerColor)
        ),
        child:  Icon(icon),
      ),
    );
  }
}
