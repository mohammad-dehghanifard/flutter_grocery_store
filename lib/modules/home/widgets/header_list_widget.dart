import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HeaderListWidget extends StatelessWidget {
  const HeaderListWidget({
    super.key, required this.title, required this.showMoreTap,this.padding = 20
  });
  final String title;
  final double padding;
  final Function() showMoreTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: padding),
      child: Row(
        children: [
          Text(title,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
          const Spacer(),
          GestureDetector(
              onTap: showMoreTap,
              child: Text('نمایش همه',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12,color: Theme.of(context).primaryColor))),
          const SizedBox(width: 4),
          Icon(Iconsax.arrow_left,size: 16,color: Theme.of(context).primaryColor)
        ],
      ),
    );
  }
}