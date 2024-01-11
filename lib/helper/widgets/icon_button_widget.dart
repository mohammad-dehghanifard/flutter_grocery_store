import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget(
      {super.key,
      required this.icon,
      required this.onTap,
      this.marginLeft = 20,
      this.marginRight = 20,
      this.width = 40,
      this.height = 40,
      this.radius = 12,
      this.iconColor,
      this.iconSize});
  final IconData icon;
  final Function() onTap;
  final double marginLeft;
  final double marginRight;
  final Color? iconColor;
  final double? iconSize;
  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(7),
        margin:  EdgeInsets.only(left: marginLeft,right: marginRight),
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: Theme.of(context).dividerColor)
        ),
        child:  Icon(icon,color: iconColor,size: iconSize),
      ),
    );
  }
}
