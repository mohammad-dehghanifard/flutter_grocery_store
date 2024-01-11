import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/backend/models/user_model.dart';
import 'package:flutter_grocery_store/helper/widgets/appbar_widget.dart';
import 'package:flutter_grocery_store/helper/widgets/button_widget.dart';
import 'package:flutter_grocery_store/helper/widgets/text_field_widget.dart';
import 'package:iconsax/iconsax.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarWidget(title: "ویرایش پروفایل"),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              child: Column(
                children: [
                  // full name
                  const TextFieldWidget(
                    hintText: "نام و نام خانوادگی",
                    type: TextInputType.text,
                    icon: Iconsax.user,
                  ),

                  const SizedBox(height: 15),
                  //mobile
                  const TextFieldWidget(
                    hintText: "شماره موبایل",
                    type: TextInputType.phone,
                    icon: Iconsax.mobile,
                  ),
                  const SizedBox(height: 15),
                  // password
                  const TextFieldWidget(

                    hintText: "رمزعبور قبلی",
                    type: TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: 15),
                  // repeat pass
                  const TextFieldWidget(

                    hintText: "رمز عبور جدید",
                    type: TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: 25),

                  ButtonWidget(onPress: () {}, text: "ویرایش")

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
