import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CommentButtonWidget extends StatelessWidget {
  const CommentButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: MaterialButton(
        onPressed: () {},
        minWidth: MediaQuery.sizeOf(context).width,
        height: 50,
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xFFE1E1E1)),
            borderRadius: BorderRadius.circular(12)
        ),
        color: Colors.white,
        elevation: 0,
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Iconsax.message_text_1,color: Color(0xFF8C8C8C),size: 21),
            SizedBox(width: 8),
            Text("نظرات",style: TextStyle(fontSize: 16)),
            Spacer(),
            Text("78 نظر",style: TextStyle(color: Color(0xFF8C8C8C))),
            SizedBox(width: 8),
            Icon(CupertinoIcons.chevron_left,color: Color(0xFF8C8C8C),size: 16)
          ],
        ),
      ),
    );
  }
}