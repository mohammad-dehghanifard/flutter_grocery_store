import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({super.key, required this.text, required this.onTap, required this.icon});


  final String text;
  final Function() onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.15),
            blurRadius: 3,
            offset: const Offset(0,1)
          )
        ],
        borderRadius: BorderRadius.circular(12)
      ),
      child: MaterialButton(
        onPressed: onTap,
        minWidth: MediaQuery.sizeOf(context).width,
        height: 50,
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xFFEBEBEB)),
            borderRadius: BorderRadius.circular(12)
        ),
        color: Colors.white,
        elevation: 0,
        child:  Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon,color: Theme.of(context).primaryColor,size: 26),
            const SizedBox(width: 12),
            Text(text,style: const TextStyle(fontWeight: FontWeight.normal)),
            const Spacer(),
            Icon(Iconsax.arrow_left,color: Theme.of(context).primaryColor),
          ],
        ),
      ),
    );
  }
}