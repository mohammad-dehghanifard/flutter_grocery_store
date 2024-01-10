import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/helper/widgets/button_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class CommentBottomSheet extends StatelessWidget {
  const CommentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child:  Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("ارسال نظر",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
            // rating bar
            Center(
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: RatingBarIndicator(
                  rating: 3,
                  itemBuilder: (context, index) => const Icon(
                    Iconsax.star1,
                    color: Color(0xFFF4D42D),
                  ),
                  itemCount: 5,
                  direction: Axis.horizontal,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // text field
            TextFormField(
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Color(0xFFE1E1E1))
                ),
                hintText: "نظر خود را وارد کنید",
                hintStyle: const TextStyle(color: Color(0xFFB4B4B4),fontSize: 16,fontWeight: FontWeight.normal)
              ),
            ),
            const SizedBox(height: 20),
            // send comment btn
            ButtonWidget(
                onPress: () {},
                text: "ارسال نظر")
          ]
      ),
    );
  }
}
